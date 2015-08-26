require 'rails_helper'

describe UsersController, type: :controller do
  login_user
  describe "GET #index" do
    let(:company) { create :company }
    before { company.users<<@current_user }
    before { get :index }

    it "render index view and application layout" do
      expect(response).to render_template(:index)
      expect(response).to render_template(:application)
    end

    describe "@team" do
      before do
        @user = create(:user)
        @current_user.company.users<<@user
        @team = User.my_team(@current_user).decorate
      end
      it "is assigned" do
        expect(assigns(:team)).to_not be_empty
      end
      it "contain proper users" do
        expect(@team).to include(@user)
        expect(@team).to_not include(@current_user)
      end
    end
  end

  describe "DELETE #destroy" do

    it "deletes the user" do
      joe = create :user
      expect{ delete :destroy, id: joe}.to change(User, :count).by(-1)
    end
    it "redirect to users_url" do
      joe = create :user
      delete :destroy, id: joe
      expect(response).to redirect_to(users_url)
    end
  end
end
