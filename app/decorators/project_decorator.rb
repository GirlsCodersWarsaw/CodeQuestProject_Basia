class ProjectDecorator < Draper::Decorator
  delegate_all

  # def project_members_list
  #   object.users.map{|u| u.first_name}.join(", ")
  # end

end
