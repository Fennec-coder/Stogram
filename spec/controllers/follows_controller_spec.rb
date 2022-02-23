# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'
require 'database_cleaner/active_record'

RSpec.describe FollowsController, type: :controller do
  let(:user) { create :user }

  before { sign_in user }

  describe '#create' do
    let!(:user) { create :user }
    let(:params) { { being_followed_id: user.id } }

    subject { process :create, method: :post, params: params }

    it 'create follows' do
      expect { subject }.to change { Follow.count }.by(1)
      is_expected.to redirect_to(user_path(user))
    end
  end

  describe '#destroy' do
    let!(:being_followed) { create :user }
    let!(:follow) { create :follow, follower: user, being_followed: being_followed }
    let(:params) { { id: being_followed.id } }

    subject { process :destroy, method: :delete, params: params }

    it 'destroy follow' do
      expect { subject }.to change { Follow.count }.by(-1)
    end
  end
end

DatabaseCleaner.clean
