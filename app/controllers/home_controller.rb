class HomeController < ApplicationController
  def index
    @projects = Project.order(updated_at: :desc).take(10)
  end
end

