class UsersController < ApplicationController
  before_action :authorize_admin, except: [:show]

  def index
    @members = User.where("role = 'member'")
  end

  def show
    @user = current_user
  end
end
