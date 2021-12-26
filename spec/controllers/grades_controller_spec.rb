# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'
require 'database_cleaner/active_record'

RSpec.describe GradesController, type: :controller do
  let(:user) { create :user }

  before { sign_in user }

  describe '#index' do
    let!(:post) { create :post, user: user }
    let!(:grade) { create :grade, user: user, post: post }
    let(:params) { { post_id: post.id } }

    subject { get :index, params: params }

    it 'assigns @grades' do
      subject
      expect(assigns(:users)).to eq([user])
    end

    it { is_expected.to render_template('index') }
  end

  describe '#create' do
    let!(:post) { create :post, user: user }
    let(:params) { { post_id: post.id } }

    subject { process :create, method: :post, params: params }
    it 'create grades' do
      expect { subject }.to change { Grade.count }.by(1)
      is_expected.to redirect_to(user_post_path(user, assigns(:post)))
    end

    context "when a user grades someone else's post" do
      let(:params) { { post_id: post1.id } }
      let!(:post1) { create :post }

      subject { process :create, method: :post, params: params }

      it 'create grades' do
        expect { subject }.to change { Grade.count }.by(1)
        is_expected.to redirect_to(user_post_path(user, assigns(:post)))
      end
    end
  end

  describe '#destroy' do
    let!(:post) { create :post, user: user }
    let!(:grade) { create :grade, user: user, post: post }

    let(:params) { { post_id: post.id, id: grade.id } }

    subject { process :destroy, method: :delete, params: params }

    it 'destroy grades' do
      expect { subject }.to change { Grade.count }.by(-1)
    end
  end
end

DatabaseCleaner.clean
