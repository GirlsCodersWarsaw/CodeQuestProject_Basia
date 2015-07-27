class Project < ActiveRecord::Base

  belongs_to :company
  has_many :memberships, validate: true
  has_many :users, through: :memberships
  validates :name, :hours, presence: true
  validates :hours, :hourly_rate, numericality: true

  after_initialize :default_value

  private

  def default_value
    self.hours ||= 1
    self.hourly_rate ||= 10
  end


end
