require 'ffaker'
# This will guess the User class
FactoryBot.define do
  factory :user do
    sequence(:id) { |number| number }
    name { FFaker::Name.name }
    username { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
