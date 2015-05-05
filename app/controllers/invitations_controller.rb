class InvitationsController < ApplicationController

	def new
		@invitation = Invitation.new
	end
	
	def create
		@invitation = Invitation.new(invitation_params)
		@invitation.sender = current_user
		@invitation.accepted = false
		if @invitation.save
			flash[:notice] = "Thank you, invitation created."
			InvitationMailer.confirmation_email(@invitation).deliver
			redirect_to users_path
		else
	    	flash[:alert] = "something is wrong :/"
	    	redirect_to users_path
	  end
	end

	def destroy
		@invitation = Invitation.find(params[:id])
		if @invitation.destroy
			flash[:success] = "Invitation deleted"
			redirect_to users_url
		else
			flash[:alert] = "something is wrong :/"
			redirect_to users_path
	  end
  end

	def confirm_invitation
		@invitation = Invitation.find(params[:id])
		@user = User.new do |user|
			user.first_name = "first_name"
			user.last_name = "last_name"
			user.email = @invitation.recipient_email
			user.password = "password"
			user.company = @invitation.sender.company
		end

		if @user.save
			@invitation.update(accepted: true)
			InvitationMailer.first_signup_data(@invitation).deliver
			redirect_to root_path, notice: 'You have accepted an invitation and have signed up successfully.'
		else
			redirect_to root_path
		end
  end 

	private

  def invitation_params
    params.require(:invitation).permit(:sender_id, :recipient_email, :accepted)
  end

end
