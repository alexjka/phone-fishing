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
    if @report.save!
      flash[:notice] = "Thanks for adding a fishing report!"
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
end
