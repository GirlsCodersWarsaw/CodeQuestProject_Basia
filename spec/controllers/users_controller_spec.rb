require 'rails_helper'

describe UsersController, type: :controller do
  login_user
  context "index" do
    let(:company) { create :company }
    before { company.users<<@current_user }
    before { get :index }

    it "render index view and application layout" do
      expect(response).to render_template(:index)
      expect(response).to render_template(:application)
    end

    context "@team" do
      before do
        @user = create(:user)
        @current_user.company.users<<@user
        @team = User.my_team(@current_user).decorate
      end
      it "assigns @team" do
        expect(assigns(:team)).to_not be_empty
      end
      it "contain proper users" do
        expect(@team).to include(@user)
        expect(@team).to_not include(@current_user)
      end
    end
  end

  context "destroy" do

    it do
      # @current_user.destroy
    end
  end
end