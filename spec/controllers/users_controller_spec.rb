require 'rails_helper'

describe UsersController, type: :controller do
  login_user
  describe "GET #index" do
    let(:company) { create :company }
    before do
      company.users<<current_user
      get :index
    end
    it "render index view and application layout" do
      expect(response).to render_template(:index)
      expect(response).to render_template(:application)
    end

    describe "assigned @team" do
      let(:user) { create :user }
      let(:team) { User.my_team(current_user).decorate }
      before { current_user.company.users<<user }
      it "contain proper users" do
        expect(team).to include(user)
        expect(team).to_not include(current_user)
      end
    end

    describe "assigned @pending_invitations" do
      let(:invitation) { create :invitation, accepted: false, sender: current_user }
      let(:pending_invitations) { Invitation.pending(current_user) }
      it "contain proper invitations" do
        expect(pending_invitations).to include(invitation)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:joe) { create :user }
    it "deletes the user" do
      expect{ delete :destroy, id: joe}.to change(User, :count).by(-1)
    end
    it "redirect to users_url" do
      delete :destroy, id: joe
      expect(response).to redirect_to(users_url)
    end
  end
end
