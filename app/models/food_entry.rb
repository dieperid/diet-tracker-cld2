class FoodEntry < ActiveRecord::Base
  # Relations
  belongs_to :user
  has_many :consumptions

  # Validations
  validates :name, :carbs, :proteins, :fats, :public, presence: true
  validates :calories, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :image, format: { with: URI::DEFAULT_PARSER.make_regexp, message: 'doit être une URL valide' },
                    allow_blank: true
end
