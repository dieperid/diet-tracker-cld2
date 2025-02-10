require 'faker'
require 'bcrypt'
require_relative '../app/models/user'
require_relative '../app/models/food_entry'
require_relative '../app/models/weight'

# Suppression des anciennes données
FoodEntry.destroy_all
Weight.destroy_all
User.destroy_all

# Création des utilisateurs avec des données fixes
users = [
  User.create!(name: 'Alice Dupont', email: 'alice@example.com',
               password_digest: BCrypt::Password.create('password123')),
  User.create!(name: 'Bob Martin', email: 'bob@example.com', password_digest: BCrypt::Password.create('password123')),
  User.create!(name: 'Charlie Durand', email: 'charlie@example.com',
               password_digest: BCrypt::Password.create('password123'))
]

# Création des entrées alimentaires
users.each do |user|
  10.times do
    FoodEntry.create!(
      user: user,
      name: Faker::Food.dish,
      calories: rand(100..800),
      carbs: rand(10..100),
      proteins: rand(5..50),
      fats: rand(5..50),
      public: true,
      image: 'https://asset.cloudinary.com/dre8cgqlb/a5ecdbf8191b5a5994456c1bba8dd32f'
    )
  end

  # Création des enregistrements de poids
  5.times do
    Weight.create!(
      user: user,
      weight: rand(50.0..120.0).round(1),
      date: Faker::Date.between(from: 1.year.ago, to: Date.today)
    )
  end
end

puts 'Seed completed successfully!'
