class Company < ActiveRecord::Base
  has_many :users
  has_many :projects
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
