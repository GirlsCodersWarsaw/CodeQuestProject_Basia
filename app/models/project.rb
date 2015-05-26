class Project < ActiveRecord::Base
	belongs_to :company
	has_and_belongs_to_many :users
	validates :name, :billable, :hours, presence: true
	validates :hours, :hourly_rate, numericality: true


end
