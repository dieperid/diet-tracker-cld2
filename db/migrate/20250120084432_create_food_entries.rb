# frozen_string_literal: true

class CreateFoodEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :food_entries do |t|
      t.references :user, null: false, foreign_key: true

      t.string :name, null: false
      t.float :calories, null: false
      t.float :carbs, null: false
      t.float :proteins, null: false
      t.float :fats, null: false
      t.boolean :public, null: false, default: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
