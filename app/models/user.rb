class User < ActiveRecord::Base

  belongs_to :company
  has_and_belongs_to_many :projects

  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :last_name, :first_name, presence: true

  scope :my_team, -> (user) {
    joins(:company).
    where("companies.name = ?", user.company.name).
    where.not(id: user.id)
  }

end
