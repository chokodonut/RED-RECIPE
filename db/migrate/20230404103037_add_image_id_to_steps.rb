class AddImageIdToSteps < ActiveRecord::Migration[6.1]
  def change
    add_column :steps, :image_id, :string
  end
end
