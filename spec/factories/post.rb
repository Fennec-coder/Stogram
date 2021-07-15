require 'ffaker'
# This will guess the User class
FactoryBot.define do
  factory :post do
    association :user

    description { FFaker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/really_pixel.png')) }
  end
end
