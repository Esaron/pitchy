class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :owned_by_user, only: [:show]
  before_action :liked, only: [:show, :update]

  def new
  end

  def create
    @project = Project.create!(project_params.merge!(creator: current_user))
    create_and_upload_slides

    redirect_to action: :show, name: @project.name
  end

  def show
    head :not_found if project.blank?
  end

  def update
    return head :not_found unless owned_by_user

    project.update!(description: project_params[:description])

    redirect_to action: :show, name: project.name
  end

  private

  def create_and_upload_slides
    # do some actual work
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
    params.permit(:name, :description)
  end
end

