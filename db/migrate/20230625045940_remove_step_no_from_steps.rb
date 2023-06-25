class RemoveStepNoFromSteps < ActiveRecord::Migration[6.1]
  def change
    remove_column :steps, :step_no, :integer
  end
end
