class Project < ActiveRecord::Base

  belongs_to :company
  has_and_belongs_to_many :users
  validates :name, :hours, presence: true
  validates :hours, :hourly_rate, numericality: true
  validates :users, uniqueness: { scope: :email }

  after_initialize :default_value

  private

  def default_value
    self.hours ||= 1
    self.hourly_rate ||= 10
  end


end
