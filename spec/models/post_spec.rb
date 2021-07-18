require 'rails_helper'
require 'ffaker'

FactoryBot.define do
  factory :post do
    association :user

    description { FFaker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/really_pixel.png')) }

    trait(:with_invalid_image) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/really_pixel.txt')) }
    end
  end
end
