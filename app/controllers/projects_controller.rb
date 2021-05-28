class ProjectsController < ProtectedController
  before_action :check_ownership, only: [:show, :update]
  before_action :project, only: [:show, :update]

  def new
  end

  def create
    @project = Project.create!(project_params.merge!(user: current_user))
    create_and_upload_slides

    redirect_to :show
  end

  def show
  end

  def update
    @project = Project.update!(description: project_params[:description], user: current_user)

    redirect_to :show
  end

  private

  def project
    @project ||= Project.find_by(name: project_params[:name])
  end

  def check_ownership
    @owned_by_user ||= current_user == project.user
  end

  def project_params
    params.permit(:name, :description)
  end
end

