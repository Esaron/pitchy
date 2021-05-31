class SlidesController < ApplicationController
  def index
    render json: { urls: project.current_pitch_deck&.slide_image_urls || [] }
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

