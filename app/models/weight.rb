class Weight < ActiveRecord::Base
  # Relations
  belongs_to :user

  # Validations
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
end
