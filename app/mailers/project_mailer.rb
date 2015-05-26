class ProjectMailer < ActionMailer::Base
  default from: "barbaraklosowska@gmail.com"

  def invite_to_project(project, user)
  	@project = project
  	@user = user
  	mail(to: @user, subject: 'You are invited to project')
  end

end
