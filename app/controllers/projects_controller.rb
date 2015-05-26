class ProjectsController < ApplicationController
	def index
		@project = current_user.projects
	end

	def new
		@project = Project.new
	end

	def create
    @project = Project.new(project_params)

    if @project.save
      @project.users<<current_user
      redirect_to projects_path,  notice: "Your project was saved"
    else
      render "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
      if @project.update(project_params)
        flash[:notice] = "You have updated your project successfully."
        redirect_to projects_path
      else
        render :edit
      end
  end

  def destroy
    @project = Project.find(params[:id])
    
    if @project.destroy
        redirect_to projects_url, notice: "Project deleted."
    end
  end

  def show_email
    @email = params[:email]
  end

  def invite  
    @project = Project.find(params[:id])
    email = params['invite_to_project']['email']
    @user = User.where(email: email)

    if @user.blank?
      flash[:alert] = "there is no user with email: '#{email}' in your team :("
      redirect_to edit_project_path
    else
      @project.users<<@user
      ProjectMailer.invite_to_project(@project, @user).deliver
      redirect_to edit_project_path
    end
    
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
