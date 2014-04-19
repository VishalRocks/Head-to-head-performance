class AddPercent1ToPrediction < ActiveRecord::Migration
  def change
    add_column :predictions, :percent1, :decimal
  end
end
