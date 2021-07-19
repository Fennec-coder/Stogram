# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :post do
    association :user

    description { FFaker::Lorem.sentence }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/pixel.png')) }

    trait(:with_invalid_image) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/text.txt')) }
    end
  end
end
