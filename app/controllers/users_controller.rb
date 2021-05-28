class UsersController < ApplicationController
  def show
    return head :not_found if user.blank?

    @projects = user.projects.order(updated_at: :desc)
    @likes = user.likes.order(updated_at: :desc)
  end

  private

  def user
    @user ||= User.find_by(email: email)
  end

  def email
    @email ||= user_params[:email]
  end

  def user_params
    params.permit(:email)
  end
end

