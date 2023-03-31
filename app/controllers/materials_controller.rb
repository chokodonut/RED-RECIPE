class MaterialsController < ApplicationController
 private

  def material_params
    params.require(:material).permit(:quantity, :name)
  end
end
