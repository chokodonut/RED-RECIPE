class ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @report = current_user.reports.new(report_params)
    @report.recipe_id = @recipe.id
    #binding.pry
    @report.save
    #byebug
    redirect_to  recipe_reports_path
  end

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @report = @recipe.reports
  end

  private

  def report_params
    params.require(:report).permit(:content, :image)
  end
end
