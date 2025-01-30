class FoodEntry < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_many :consumptions

  # Validations
  validates :name, :carbs, :proteins, :fats, :public, presence: true
  validates :calories, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
