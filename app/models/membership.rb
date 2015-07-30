class Membership < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  validates_uniqueness_of :user, scope: :project, message: "is already member of this project"

end