# frozen_string_literal: true

class Search < ApplicationRecord
  def self.by_username(desired)
    return if (desired == "") || (desired.length < 3)

    desired = desired.downcase
    User.all.where("lower(username) LIKE :desired", desired: "%#{desired}%").limit(10)
  end

  def self.by_email(desired)
    return if (desired == "") || (desired.length < 3)

    desired = desired.downcase
    User.all.where("lower(email) LIKE :desired", desired: "%#{desired}%").limit(10)
  end

  def self.by_name(desired)
    return if (desired == "") || (desired.length < 3)

    desired = desired.downcase
    User.all.where("lower(name) LIKE :desired", desired: "%#{desired}%").limit(10)
  end

  def self.by_description_of_post(desired)
    return if (desired == "") || (desired.length < 3)

    desired = desired.downcase
    Post.all.where("lower(description) LIKE :desired", desired: "%#{desired}%").limit(10)
  end
end
