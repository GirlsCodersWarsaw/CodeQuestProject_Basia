class ProjectMemberService

  def initialize(params)
    @project = Project.find(params[:id])
    @email = params[:invite_to_project][:email]
    @user = User.where(email: @email)
  end

  def verify_user
    if @user.blank?
      false
    else
      true
    end
  end

  #
  # def add
  #   if @user.blank?
  #     flash[:alert] = "there is no user with email: '#{@email}' in your team :("
  #     return false
  #   else
  #     return true
  #     end
  #   end
  # end

end