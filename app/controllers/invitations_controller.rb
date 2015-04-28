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
			redirect_to users_path
		else
	    	flash[:alert                                                                                                    ] = "something is wrong :/"
	    	redirect_to users_path
	  end
	end

	def confirm_invitation
    @invitation = Invitation.find(params[:id])
    @user = User.find(params[:invitation][:sender_id])
    @signup = Signup.new(params[:signup])

    if @signup.save
      sign_in @signup.user
      @invitation.update(accepted: true)
      redirect_to root_path, notice: 'You have accepted an invitation an have signed up successfully.'
    else
      render action: :new
    end
  end 

	private

  def invitation_params
    params.require(:invitation).permit(:sender_id, :recipient_email, :accepted)
  end

end
