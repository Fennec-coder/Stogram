require 'rails_helper'
require 'capybara/rails'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create :user }

  before { sign_in user }

  describe '#create' do
    let!(:post) { create :post, user: user }
    let(:params) do
      {
        user_id: user.id,
        post_id: post.id,
        comment: attributes_for(:comment)
      }
    end

    subject { process :create, method: :post, params: params }

    it 'create comment' do
      expect { subject }.to change { Comment.count }.by(1)
      is_expected.to redirect_to(user_post_path(user, assigns(:post)))
    end

    context "user comments someone else's post" do
      let(:params) do
        {
          user_id: user.id,
          post_id: post.id,
          comment: { body: 'Body' }
        }
      end

      subject { process :create, method: :post, params: params }

      it 'create comment' do
        expect { subject }.to change { Comment.count }.by(1)
        is_expected.to redirect_to(user_post_path(user, assigns(:post)))
      end
    end
  end
end
