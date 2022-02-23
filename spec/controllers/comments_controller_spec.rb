# frozen_string_literal: true

# frozen_string_literal: true

require "rails_helper"
require "capybara/rails"
require "database_cleaner/active_record"

RSpec.describe CommentsController, type: :controller do
  let(:user) { create :user }

  before { sign_in user }

  describe "#create" do
    let!(:post) { create :post, user: user }
    let(:params) do
      {
        user_id: user.id,
        post_id: post.id,
        comment: attributes_for(:comment),
      }
    end

    subject { process :create, method: :post, params: params }

    it "create comment" do
      expect { subject }.to change { Comment.count }.by(1)
      is_expected.to redirect_to(user_post_path(user, assigns(:post)))
    end

    context "user comments someone else's post" do
      let(:params) do
        {
          user_id: user.id,
          post_id: post.id,
          comment: { body: "Body" },
        }
      end

      subject { process :create, method: :post, params: params }

      it "create comment" do
        expect { subject }.to change { Comment.count }.by(1)
        is_expected.to redirect_to(user_post_path(user, assigns(:post)))
      end
    end

    describe "#destroy" do
      let!(:post) { create :post, user: user }
      let!(:comment) { create :comment, user_id: user.id, post: post }

      let(:params) { { post_id: post.id, id: comment.id } }

      subject { process :destroy, method: :delete, params: params }

      it "delete comment" do
        expect { subject }.to change { Comment.count }.by(-1)
        is_expected.to redirect_to(user_post_path(user, assigns(:post)))
      end
    end
  end
end
DatabaseCleaner.clean
