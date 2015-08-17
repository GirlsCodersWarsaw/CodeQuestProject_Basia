class Signup

  include ActiveModel::Validations

  attr_reader :user, :company, :first_name, :last_name, :company_name, :email, :password, :password_confirmation, :errors

  validates :first_name, :last_name, :company_name, :email, presence: true
  validates :password, presence: true,
            length: {within: 8..40},
            confirmation: true
  validate :email_is_unique

  def initialize(params)
    @first_name = params[:user][:first_name]
    @last_name = params[:user][:last_name]
    @company_name = params[:user][:company][:company_name]
    @email = params[:user][:email]
    @password = params[:user][:password]
    @password_confirmation = params[:user][:password_confirmation]
    @errors = ActiveModel::Errors.new(self)
  end

  # Forms are never themselves persisted
  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def email_is_unique
    unless User.where('lower(email) = ?', email.downcase).count == 0
      errors.add(:email, 'has already been taken')
    end
  end

  def persist!
    ActiveRecord::Base.transaction do
      @company = Company.where('lower(name) = ?', company_name.downcase).first_or_create!(name: company_name)
      @user = @company.users.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    end
  end

end
