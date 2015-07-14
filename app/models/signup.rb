class Signup

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_reader :user, :company, :first_name, :last_name, :company_name, :email, :password

  def initialize(params)
    @first_name = params[:user][:first_name]
    @last_name = params[:user][:last_name]
    @company_name = params[:user][:company][:company_name]
    @email = params[:user][:email]
    @password = params[:user][:password]
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

  def persist!
    ActiveRecord::Base.transaction do
      @company = Company.create!(name: company_name)
      @user = @company.users.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    end
  end


end