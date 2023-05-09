class Admin::ReportsController < ApplicationController

  

  def destroy
    # @recipe = Recipe.find(params[:recipe_id])
    report = Report.find(params[:id])

    report.destroy
    redirect_to admin_root_path, noice: "レポートを削除しました。"
  end
end
