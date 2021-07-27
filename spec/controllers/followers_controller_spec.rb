require 'rails_helper'
require 'capybara/rails'

RSpec.describe FollowersController, type: :controller do
  let(:follower) { create :user }

  before { sign_in follower }

  describe '#index' do
    let!(:following) { create :user }
    let!(:follow) { create :follow, follower: follower, being_followed: following }
    let(:params) { { user_id: following.id } }

    subject { get :index, params: params }

    it 'assigns @followers' do
      subject
      expect(assigns(:followers)).to eq([follower])
    end

    it { is_expected.to render_template('index') }
  end
end
