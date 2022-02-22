# frozen_string_literal: true

FactoryBot.define do
  factory :follow do
    follower
    being_followed
  end
end
