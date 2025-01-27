class FoodEntry < ActiveRecord::Base
  # Relations
  belongs_to :user

  # Validations
  validates :name, presence: true
  validates :calories, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true
end
