# frozen_string_literal: true

# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:grades) }

  it { is_expected.to have_many(:follower_follows).with_foreign_key(:being_followed_id).class_name("Follow") }
  it { is_expected.to have_many(:followers).through(:follower_follows).source(:follower) }

  it { is_expected.to have_many(:following_follows).with_foreign_key(:follower_id).class_name("Follow") }
  it { is_expected.to have_many(:being_followeds).through(:following_follows).source(:being_followed) }

  describe "#email" do
    it { is_expected.to_not allow_value("invalid_email").for(:email) }
    it { is_expected.to allow_value("valid@email.com").for(:email) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
  end
end
