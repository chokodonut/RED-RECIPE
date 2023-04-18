class ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def create
    @report = current_user.reports.new(report_params)
    @report.save
    #byebug
    redirect_to  recipe_reports_path
  end

  def index
    @report = Report.all
  end

  private

  def report_params
    params.require(:report).permit(:content, :image)
  end
end
