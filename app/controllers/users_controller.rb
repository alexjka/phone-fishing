class UsersController < ApplicationController
  before_action :authorize_admin, except: [:show]

  def index
    @members = User.where("role = 'member'")
  end

  def show
    @user = current_user
    # @user_releases = @user.releases.order(updated_at: :desc)
    # @user_reviews = Review.where("user_id = #{@user.id}").order(updated_at: :desc)
    # @user_comments = @user.comments.order(updated_at: :desc)
  end

  # def destroy
  #   user = User.find(params[:id])
  #   Comment.delete_all("user_id = '#{params[:id]}'")
  #   Review.delete_all("user_id = '#{params[:id]}'")
  #   releases = user.releases
  #
  #   releases.each do |release|
  #     destroy_release(release)
  #   end
  #
  #   user.destroy
  #   flash[:notice] = "User successfully deleted"
  #   redirect_to users_path
  # end
  #
  private
  # def authorize_admin
  #   if !user_signed_in?
  #     raise ActionController::RoutingError.new("Not Found")
  #   elsif !current_user.is_admin?
  #     raise ActionController::RoutingError.new("Not Found")
  #   end
  # end
end
