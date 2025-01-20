class CreateWeights < ActiveRecord::Migration[7.2]
  def change
    create_table :weights do |t|
      t.references :user, null: false, foreign_key: true
      t.float :weight, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
