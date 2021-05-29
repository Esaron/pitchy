class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :owned_by_user, only: [:show]
  before_action :liked, only: [:show, :update]

  def new
  end

  def create
    @project = Project.create!(project_params.merge!(creator: current_user))
    create_and_upload_files

    redirect_to action: :show, name: @project.name
  end

  def show
    head :not_found if project.blank?
  end

  def update
    return head :not_found unless owned_by_user

    project.update!(description: project_params[:description])
    create_and_upload_files

    redirect_to action: :show, name: project.name
  end

  private

  def create_and_upload_files
    if project_params[:pitch_deck].present?
      PitchDeck.transaction do
        pitch_deck = PitchDeck.create!(project: project, file: project_params[:pitch_deck])
        file_path = pitch_deck.file.current_path
        if ['.docx', '.pptx'].include? File.extname(file_path)
          create_slides pitch_deck, Docsplit.extract_images(file_path, formats: [:png]).first
        else
          create_slides pitch_deck, file_path
        end
      end
    end
  end

  def create_slides(pitch_deck, pitch_deck_file)
    image = MiniMagick::Image.open(pitch_deck_file)
    image.pages.each do |page|
      page.format 'png'
      page.background 'white'
      page.flatten
      Slide.create!(pitch_deck: pitch_deck, image: page)
    end
  end

  def project
    @project ||= Project.find_by(name: project_params[:name])
  end

  def liked
    @liked ||= project.likes.exists?(user: current_user)
  end

  def owned_by_user
    @owned_by_user ||= current_user == project.creator
  end

  def project_params
    params.permit(:name, :description, :pitch_deck)
  end
end

