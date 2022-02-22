# frozen_string_literal: true

require 'ffaker'

FactoryBot.define do
  factory :comment do
    association :post
    user_id {}
    body { FFaker::Lorem.sentence }
  end
end
