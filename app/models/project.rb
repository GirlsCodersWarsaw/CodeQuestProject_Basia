class Project < ActiveRecord::Base
<<<<<<< HEAD
	belongs_to :company
	has_and_belongs_to_many :users
	validates :name, :hours, presence: true
	validates :hours, :hourly_rate, numericality: true
=======
  belongs_to :company
  has_and_belongs_to_many :users
  validates :name, :billable, :hours, presence: true
  validates :hours, :hourly_rate, numericality: true
>>>>>>> develop

  after_initialize :default_value

  def add_user_to_project(user)
    if user.in?(self.users)
      false
    else
      self.users<<user
      true
    end
  end

<<<<<<< HEAD
	def project_members_list
		self.users.map{|u| u.first_name}.join(", ")
	end

	private
=======
  private
>>>>>>> develop

  def default_value
    self.hours ||= 1
    self.hourly_rate ||= 10
  end


end
