class ProjectMemberService

  include ActiveModel::Validations

  attr_reader :project, :email, :user, :errors

  def initialize(params)
    @project = Project.find(params[:id])
    @email = params[:invite_to_project][:email]
    @user = User.find_by(email: email)
    @errors = ActiveModel::Errors.new(self)
  end

  def add_user
    if user.blank? && email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:user, "with that email doesn't exist in your team")
      false
    elsif user.blank?
      errors.add(:base, "it doesn't look like email")
      false
    else
      verify_user && send_email
    end
  end

  def send_email
    ProjectMailer.invite_to_project(project, user).deliver
  end

  def verify_user
    if user.in?(project.users)
      errors.add(:user, "is already member of this project")
      false
    else
      Membership.create(project_id: project.id, user_id: user.id, user_role: "member", accepted: false)
    end
  end

end