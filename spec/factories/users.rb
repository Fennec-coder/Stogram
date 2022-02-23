# frozen_string_literal: true

# frozen_string_literal: true

require "ffaker"
# This will guess the User class
FactoryBot.define do
  # aliases:
  # :follower, :being_followed for fallow
  factory :user, aliases: %i[follower being_followed] do
    name { FFaker::Name.name }
    username { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end
end
