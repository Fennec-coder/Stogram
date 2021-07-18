# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_one_attached(:image) }

  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:likes) }

  it { is_expected.to have_many(:post_hash_tags) }
  it { is_expected.to have_many(:hash_tags).through(:post_hash_tags) }

  context 'validates image format' do
    it 'allows to set png file as an image' do
      user = create(:user)
      subject.attributes = attributes_for(:post)
      subject.user = user
      is_expected.to be_valid
    end

    it 'allows to set txt file as an image' do
      user = create(:user)
      subject.attributes = attributes_for(:post, :with_invalid_image)
      subject.user = user
      is_expected.to be_invalid
    end
  end
end
