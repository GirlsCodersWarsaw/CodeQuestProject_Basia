class ProjectsController < ApplicationController
	def index
		@project = Project.all
	end

	def new
		@project = Project.new
	end

	def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path,  notice: "Your project was saved"
    else
      render "new"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    
    if @project.destroy
        redirect_to projects_url, notice: "Project deleted."
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
