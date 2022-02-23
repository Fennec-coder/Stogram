# frozen_string_literal: true

# frozen_string_literal: true

require "rails_helper"
require "capybara/rails"
require "database_cleaner/active_record"

RSpec.describe FollowingsController, type: :controller do
  let(:follower) { create :user }
  let(:params) { { user_id: follower.id } }

  before { sign_in follower }

  describe "#index" do
    let!(:following) { create :user }
    let!(:follow) { create :follow, follower: follower, being_followed: following }

    subject { get :index, params: params }

    it "assigns @followings" do
      subject
      expect(assigns(:followings)).to eq([following])
    end

    it { is_expected.to render_template("index") }
  end
end
DatabaseCleaner.clean
