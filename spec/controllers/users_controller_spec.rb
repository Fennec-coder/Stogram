# frozen_string_literal: true

# frozen_string_literal: true

require "rails_helper"
require "capybara/rails"
require "database_cleaner/active_record"

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  let(:params) { { id: user } }

  before { sign_in user }

  context "valid factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  describe "#show" do
    let(:params) { { id: user.id } }
    subject { get :show, params: params }

    it "assigns @user" do
      subject
      expect(assigns(:user)).to eq(user)
    end

    context "see another users page" do
      let!(:user) { create :user }

      it "assigns @user" do
        subject
        expect(assigns(:user)).to eq(user)
      end
    end

    it { is_expected.to render_template(:show) }
  end
end
DatabaseCleaner.clean
