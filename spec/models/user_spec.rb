require 'rails_helper'

describe User do

  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context 'associations' do
    it { should belong_to(:company) }
    it { should have_many(:memberships) }
    it { should have_many(:projects).through(:memberships) }
  end

  describe "my_team" do
    context "not include current user" do
      let(:current_user) { create :user }
      let(:u1) { create :user }
      let(:u2) { create :user }
      let(:company) { create :company }
      before { company.users<<[current_user, u1, u2] }

      it { expect(User.my_team(current_user)).to include(u1, u2) }
      it { expect(User.my_team(current_user)).to_not include(current_user) }
    end
  end

end
