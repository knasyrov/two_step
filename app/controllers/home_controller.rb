class HomeController < ApplicationController
  before_action :load_users, only: [:index]
  def index
  end

  private

  def load_users
    @users = User.all
  end
end
