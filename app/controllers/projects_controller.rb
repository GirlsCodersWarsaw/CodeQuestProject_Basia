class ProjectsController < ApplicationController
  def index
    @projects = ProjectPresenter.wrap(current_user.projects)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      Membership.create(project_id: @project.id, user_id: current_user.id, user_role: "owner", accepted: true)
      redirect_to projects_path,  notice: "Your project was saved"
    else
      render "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
    @membership = @project.memberships.build(user_role: "member", accepted: false)
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "You have updated your project successfully."
      redirect_to projects_path
    else
      flash[:alert] = "project wasn't updated :("
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy
    redirect_to projects_url, notice: "Project deleted."
  end

  def invite
    # service = ProjectMemberService.new(params)
    #
    # if service.add_user
    #   flash[:notice] = "'#{service.user.first_name}' was added to project: '#{service.project.name}' #{service.errors.full_messages}"
    #   redirect_to edit_project_path
    # else
    #   flash[:alert] = "user with email: '#{service.email}' wasn't added to project: '#{service.project.name}' #{service.errors.full_messages}"
    #   redirect_to edit_project_path
    # end
  end

  private

  def project_params
    params.require(:project).permit(:name,
                                    :hours,
                                    :hourly_rate,
                                    :billable,
                                    :currency,
                                    :company_id)
  end

end
