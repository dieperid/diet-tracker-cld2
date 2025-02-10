class FoodEntry < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_many :consumptions

  # Validations
  validates :name, :carbs, :proteins, :fats, presence: true
  validates :calories, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :image, presence: true # format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
end
