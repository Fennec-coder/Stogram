# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Grade, type: :model do
  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }
end
