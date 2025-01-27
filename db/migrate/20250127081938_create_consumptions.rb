class CreateConsumptions < ActiveRecord::Migration[7.2]
  def change
    create_table :consumptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food_entries, null: false, foreign_key: true

      t.date :consumption_date, null: false
      t.float :quantity, null: false

      t.timestamps
    end
  end
end
