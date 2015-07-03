class Invitation < ActiveRecord::Base

	belongs_to :sender, :class_name => 'User'
	has_one :recipient, :class_name => 'User'

	validates :recipient_email, 
			presence: true, 
			format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, 
			uniqueness: {case_sensitive: false}
	validate :recipient_is_not_registered

	scope :pending, -> (user) {
    where(accepted: false, sender: user)
  	}

	private

	def recipient_is_not_registered
	  errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
	end

end
