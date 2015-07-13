class Project < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :users
  validates :name, :billable, :hours, presence: true
  validates :hours, :hourly_rate, numericality: true

  after_initialize :default_value

  def add_user_to_project(user)
    if user.in?(self.users)
      false
    else
      self.users<<user
      true
    end
  end

  private

  def default_value
    self.hours ||= 1
    self.hourly_rate ||= 10
  end


end
