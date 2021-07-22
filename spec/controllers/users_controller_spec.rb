require 'rails_helper'
require 'capybara/rails'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  let(:params) { { id: user } }

  before { sign_in user }

  describe '#show' do
    let(:params) { { id: user.id } }
    subject { get :show, params: params }

    # user profile to user ratio
    it 'assigns @user' do
      subject
      expect(assigns(:user)).to eq(user)
    end

    it { is_expected.to render_template(:show) }
  end
end
