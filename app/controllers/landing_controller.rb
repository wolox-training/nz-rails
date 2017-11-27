class LandingController < ApplicationController
  protect_from_forgery with: :exception
  before_action :user_login_landing

  def index; end

  def user_login_landing
    if current_user.nil?
    else
      @user = User.find(current_user.id)
    end
  end
end
