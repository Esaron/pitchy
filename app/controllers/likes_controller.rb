class LikesController < ProtectedController
  skip_before_action :verify_authenticity_token

  def toggle
    if like.exists?
      like.first.destroy!
    else
      like.create!
    end

    head :no_content
  end

  private

  def project
    @project ||= Project.find_by(name: project_params[:project_name])
  end

  def like
    @like ||= Like.where(user: current_user, project: project)
  end

  def project_params
    params.permit(:project_name)
  end
end

