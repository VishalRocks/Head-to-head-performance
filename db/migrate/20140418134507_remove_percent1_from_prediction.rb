class RemovePercent1FromPrediction < ActiveRecord::Migration
  def change
    remove_column :predictions, :percent1, :decimal
  end
end
