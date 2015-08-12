class InvitationsController < ApplicationController

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.sender = current_user
    @invitation.accepted = false

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to users_path, notice: "Thank you, invitation created." }
        format.json { render json: @invitation, status: :ok }
      else
        format.html { redirect_to users_path, alert: "something is wrong" }
        format.json { render json: @invitation.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invitation = Invitation.find(params[:id])

    @invitation.destroy
    flash[:notice] = "Invitation deleted"
    redirect_to users_path
  end

  def confirm_invitation
    @invitation = Invitation.find_by(id: params[:id])
    if @invitation
      @user = User.new do |user|
        user.first_name = "first_name"
        user.last_name = "last_name"
        user.email = @invitation.recipient_email
        user.password = "password"
        user.company = @invitation.sender.company
      end

      if @user.save
        @invitation.update_columns(accepted: true)
        InvitationMailer.first_signup_data(@invitation).deliver
        redirect_to root_path, notice: 'You have accepted an invitation and have signed up successfully.'
      else
        redirect_to root_path
      end
    else
      flash[:alert] = "your invitation is out of date"
      redirect_to root_url
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:sender_id, :recipient_email, :accepted)
  end

end
