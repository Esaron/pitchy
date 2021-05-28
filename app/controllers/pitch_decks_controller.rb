class PitchDecksController < ProtectedController
  def upload
    @pitch_deck = PitchDeck.find_or_create_by!(project: project)
    create_and_upload_slides

    redirect_to project_path(pitch_deck_params[:project_id])
  end

  private

  def project
    @project ||= Project.find_by!(id: pitch_deck_params[:project_id], user: current_user)
  end

  def create_and_upload_slides
    # process files
  end

  def pitch_deck_params
    params.require(:pitch_deck).permit(:project_id, :files)
  end
end

