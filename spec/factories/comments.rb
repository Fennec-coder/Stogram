# frozen_string_literal: true

# frozen_string_literal: true

require "ffaker"

FactoryBot.define do
  factory :comment do
    association :post
    user_id { |n| n }
    body { FFaker::Lorem.sentence }
  end
end
