class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @report = Report.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @report = Report.new(report_params)
    @report.spot = @spot
    @report.user = current_user
    all_user = User.all

    users_with_favorite = @spot.users
    # all_user.each do |user|
    #   if user.spots
    #     if user.favorites.checked? == true
    #       users_with_favorite << user
    #     end
    #   end
    # end
    if @report.save!
      flash[:notice] = "Thanks for adding a fishing report!"

      users_with_favorite.each do |s|
        s.send_sms(@spot)
      end

      # acct_sid = ENV['TWILIO_ACCOUNT_SID']
      # auth_token = ENV['TWILIO_AUTH_TOKEN']
      # from = ENV['TWILIO_PHONE_NUMBER']
      #
      # @client = Twilio::REST::Client.new acct_sid, auth_token
      #
      # text_body = "Howdy #{user.username}! There has been a new fishing report posted #{spot.name}."
      #
      # to = @user.cell_number
      # to = '+1' + to
      #
      # @client.account.create(
      #   :from => from,
      #   :to => to,
      #   :body => text_body
      # )
    end
    redirect_to spot_path(@spot)
  end


  def destroy
    report = Report.find(params[:id])
    report.destroy
    flash[:notice] = "Deleted, now no one knows how the fishing was."
    redirect_to spot_path(spot)
  end

  private

  def report_params
    params.require(:report).permit(
      :body
    )
  end

  def checked?
    favorite.checked?
  end
end
