class UsersController < ApplicationController

  def index
    @team = User.my_team(current_user).decorate
    @invitation = Invitation.new
    @pending_invitations = Invitation.pending(current_user)
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to users_url, notice: "User deleted."
  end

end