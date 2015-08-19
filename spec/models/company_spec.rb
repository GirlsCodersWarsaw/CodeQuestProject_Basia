require 'rails_helper'

describe Company do

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).
                              case_insensitive }
  end

  context 'associations' do
    it { should have_many(:users) }
    it { should have_many(:projects) }
  end

end
