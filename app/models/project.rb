class Project < ActiveRecord::Base
	belongs_to :company
	validates :name, :billable, :hours, presence: true
	validates :hours, :hourly_rate, numericality: true

end
