require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:likes) }

  it { is_expected.to have_many(:follower_follows).with_foreign_key(:following_id).class_name('Follow') }
  it { is_expected.to have_many(:followers).through(:follower_follows).source(:follower) }

  it { is_expected.to have_many(:following_follows).with_foreign_key(:follower_id).class_name('Follow') }
  it { is_expected.to have_many(:followings).through(:following_follows).source(:following) }

  describe '#email' do
    it { is_expected.to_not allow_value("invalid_email").for(:email) }
    it { is_expected.to allow_value("valid@email.com").for(:email) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    # TODO: add check for uniqueness of emails
    # it { should validate_uniqueness_of(:email).scoped_to(:id) }
  end

end
