# frozen_string_literal: true

# User class definition
class User < ActiveRecord::Base
  has_secure_password

  # Relations
  has_many :weights, dependent: :destroy
  has_many :food_entries, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
