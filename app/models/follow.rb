# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :being_followed, class_name: 'User', foreign_key: 'being_followed_id'
end
