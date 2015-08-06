class ProjectMemberService

  attr_reader :project, :email, :user, :errors, :membership

  def initialize(params)
    @project = Project.find(params[:project_id])
    @email = params[:invite_to_project][:email]
    @user = User.find_by(email: email)
    @errors = ActiveModel::Errors.new(self)
    @membership = @project.memberships.build(project_id: project.id, user_role: "member", accepted: false)
  end

  def add_user

    if (email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i).nil?
      errors.add(:base, "it doesn't look like email")
      false
    elsif user.nil?
      errors.add(:base, "User with that email doesn't exist in your team")
      false
    else
      update_membership && send_email
    end
  end

  def send_email
    ProjectMailer.invite_to_project(project, user).deliver
  end

  def update_membership
    membership.user_id = user.id
    if membership.save
      true
    else
      @errors = membership.errors
      false
    end
  end

end
