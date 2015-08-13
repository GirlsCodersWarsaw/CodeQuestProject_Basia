class Signup

  include ActiveModel::Validations

  attr_reader :user, :company, :first_name, :last_name, :company_name, :email, :password, :errors

  validates :first_name, :last_name, :company_name, :email, :password, presence: true
  # validate  :employee_ids_should_belong_to_organization

  def initialize(params)
    @first_name = params[:user][:first_name]
    @last_name = params[:user][:last_name]
    @company_name = params[:user][:company][:company_name]
    @email = params[:user][:email]
    @password = params[:user][:password]
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

  # def employee_ids_should_belong_to_organization
  #   if organization.get_employees(employee_ids).length != employee_ids.length
  #     errors.add(:employee_ids, :invalid)
  #   end
  # end

  def persist!
    ActiveRecord::Base.transaction do
      if Company.find_by_name(company_name)
        @company = Company.find_by_name(company_name)
      else
        @company = Company.create!(name: company_name)
      end
      @user = @company.users.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    end
  end

end