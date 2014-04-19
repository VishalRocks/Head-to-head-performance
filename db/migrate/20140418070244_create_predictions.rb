class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.decimal :rating1
      t.decimal :volatility1
      t.decimal :rating2
      t.decimal :volatility2

      t.timestamps
    end
  end
end
