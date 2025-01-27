class Consumption < ActiveRecord::Base
  belongs_to :user
  belongs_to :food_entry

  validates :consumption_date, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
