# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_many(:comments) }

  it { is_expected.to have_many(:grades) }

  describe 'validations' do
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(100) }

    it { is_expected.to validate_presence_of(:image) }
  end

  context 'validates image format' do
    it 'allows insert the PNG file as a post picture' do
      user = create(:user)
      subject.attributes = attributes_for(:post)
      subject.user = user
      is_expected.to be_valid
    end

    it 'does not allow inserting a TXT file as a post image' do
      user = create(:user)
      subject.attributes = attributes_for(:post, :with_invalid_image)
      subject.user = user
      is_expected.to be_invalid
    end
  end
end
