class RegistrationsController < Devise::RegistrationsController


  def create
    @signup = Signup.new(params)

    if @signup.save
      sign_in @signup.user
      redirect_to root_path, notice: 'You have signed up successfully.'
    else
      self.resource = @signup
      render action: :new
    end

  end

end 