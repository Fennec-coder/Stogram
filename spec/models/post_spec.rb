require 'rails_helper'

RSpec.describe Post, type: :model do

  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_length_of(:description).is_at_most(100) }

end
