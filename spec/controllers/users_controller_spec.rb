require 'rails_helper'
require 'capybara/rails'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  let(:params) { { id: user } }

  before { sign_in user }

  context 'valid factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  describe '#show' do
    let(:params) { { id: user.id } }
    subject { get :show, params: params }

    it 'should correlate user and user page' do
      subject
      expect(assigns(:user)).to eq(user)
    end

    context 'see another users page' do
      let!(:user) { create :user }

      it 'should correlate user and user page' do
        subject
        expect(assigns(:user)).to eq(user)
      end
    end

    it { is_expected.to render_template(:show) }
  end
end
