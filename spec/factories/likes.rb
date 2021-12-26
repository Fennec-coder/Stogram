# frozen_string_literal: true

FactoryBot.define do
  factory :grade do
    association :user
    association :post
  end
end
