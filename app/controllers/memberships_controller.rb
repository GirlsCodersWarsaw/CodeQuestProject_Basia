class MembershipsController < ApplicationController

  def create
    service = ProjectMemberService.new(params)

    respond_to do |format|
      if service.add_user
        format.html { redirect_to edit_project_path(service.project), notice: "'#{service.user.first_name}' was added to project: '#{service.project.name}' #{service.errors.full_messages}" }
        format.json { render json: service, status: :ok }
      else
        format.html { redirect_to edit_project_path(service.project), alert: "user with email: '#{service.email}' wasn't added to project: '#{service.project.name}' #{service.errors.full_messages}" }
        format.json { render json: service.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end
end
