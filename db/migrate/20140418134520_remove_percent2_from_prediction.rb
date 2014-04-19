class RemovePercent2FromPrediction < ActiveRecord::Migration
  def change
    remove_column :predictions, :percent2, :decimal
  end
end
