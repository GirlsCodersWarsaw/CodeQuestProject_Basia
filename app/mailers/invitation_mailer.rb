class InvitationMailer < ActionMailer::Base
  default from: "barbaraklosowska@gmail.com"

  def confirmation_email(invitation)
    @invitation = invitation
    mail(to: invitation.recipient_email, subject: 'Invitation confirmation')
  end

  def first_signup_data(invitation)
    @invitation = invitation
    mail(to: invitation.recipient_email, subject: 'First signup')
  end

end
