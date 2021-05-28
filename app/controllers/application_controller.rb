class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :activate_profiler

  private

  def activate_profiler
    ENV['RACK_MINI_PROFILER'] = 'on' if params['pp']
    ENV['RACK_MINI_PROFILER'] = 'off' if params['pp'] == 'disabled'
  end
end
