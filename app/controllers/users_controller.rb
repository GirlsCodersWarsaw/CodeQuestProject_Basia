class UsersController < ApplicationController

	def index
		@team = User.my_team(current_user)
		@invitation = Invitation.new
		@pending_invitations = Invitation.pending(current_user)
	end

end
