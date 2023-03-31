class StepsController < ApplicationController
 private

  def step_params
    params.require(:step).permit(:step_no, :content, :image)
  end
end
