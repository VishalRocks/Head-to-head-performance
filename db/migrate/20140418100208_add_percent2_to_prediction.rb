class AddPercent2ToPrediction < ActiveRecord::Migration
  def change
    add_column :predictions, :percent2, :decimal
  end
end
