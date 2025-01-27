class CreateFoodEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :food_entries do |t|
      t.references :user, null: false, foreign_key: true

      t.string :name, null: false
      t.float :calories, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
