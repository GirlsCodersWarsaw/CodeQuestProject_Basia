require 'rails_helper'

describe Company do
  before do
    @company = create(:company)
  end
  describe "creation" do
    context "valid attributes" do
      it "has valid factory" do
        expect(@company).to be_valid
      end
    end
    context "invalid attributes" do
      it "is invalid without a name" do
        @company.name = ""
        expect(@company).to_not be_valid
      end
      it "is invalid with the same name (has to be unique)" do
        company2 = build(:company)
        company3 = build(:company, name: "my cOMPany")
        expect(company2).to_not be_valid
        expect(company3).to_not be_valid
      end
    end
  end

  describe "relationships" do
    it "has many users" do
      user = User.create
      user2 = User.create
      @company.users<<[user, user2]
      expect(@company.users).to include(user, user2)
    end
    it "has many projects" do
      project = Project.create
      project2 = Project.create
      @company.projects<<[project, project2]
      expect(@company.projects).to include(project, project2)
    end
  end

end
