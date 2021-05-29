class SlidesController < ApplicationController
  def index
    render json: { urls: project.current_pitch_deck.slides.map{ |slide| slide.image.url } }
  end

  def show
    send_file(slide_params[:url])
  end

  private

  def project
    @project ||= Project.find_by!(name: project_params[:project_name])
  end

  def project_params
    params.permit(:project_name)
  end

  def slide_params
    params.permit(:project_name, :url)
  end
end

