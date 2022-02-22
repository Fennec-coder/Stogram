# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'
require 'database_cleaner/active_record'

RSpec.describe PostsController, type: :controller do
  let(:user) { create :user }
  let(:params) { { user_id: user } }

  before { sign_in user }

  describe '#index' do
    subject { get :index, params: params }

    let!(:post) { create :post, user: user }

    it 'assigns @posts' do
      subject
      expect(assigns(:posts)).to eq([post])
    end

    it { is_expected.to render_template('index') }
  end

  describe '#show' do
    let(:params) { { user_id: user.id, id: post } }
    subject { get :show, params: params }

    let!(:post) { create :post, user: user }

    it 'assigns @post' do
      subject
      expect(assigns(:post)).to eq(post)
    end

    it { is_expected.to render_template('show') }
  end

  describe '#create' do
    let(:params) { { post: attributes_for(:post, user_id: user.id) } }

    subject { post :create, params: params }

    it 'create post' do
      expect { subject }.to change { Post.count }.by(1)
      is_expected.to redirect_to(post_path(assigns(:post)))
    end
  end

  describe '#destroy' do
    let!(:post) { create :post, user: user }
    let(:params) { { id: post, user_id: user } }

    subject { process :destroy, method: :delete, params: params }

    it 'destroy post' do
      expect { subject }.to change { Post.count }.by(-1)
      is_expected.to redirect_to(user_path(user))
    end
  end
end
DatabaseCleaner.clean
