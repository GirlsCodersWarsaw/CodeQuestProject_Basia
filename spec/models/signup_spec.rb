require 'rails_helper'

describe Signup do
  context 'is valid' do
    before do
      params = { user: {first_name: "Joe",
                        last_name: "Doe",
                        email: "example@example.com",
                        password: "password",
                        password_confirmation: "password",
                        company: { company_name: "my company"}}}
      @signup = Signup.new(params)
    end

    it 'exist' do
      expect(@signup).to be_truthy
    end

    it 'can be saved' do
      expect(@signup).to respond_to(:save)
      expect(@signup.save).to be_truthy
    end
  end

  context 'is invalid' do
    context 'email has already been taken' do
      before do
        @user = create(:user, email: "example@example.com")
        params = { user: {first_name: "Joe",
                          last_name: "Doe",
                          email: "example@example.com",
                          password: "password",
                          password_confirmation: "password",
                          company: { company_name: "my company"}}}
        @signup = Signup.new(params)
        @signup.instance_eval{ email_is_unique }
      end

      it "can't be saved" do
        expect(@signup).to respond_to(:save)
        expect(@signup.save).to be_falsy

      end

      it 'has right error' do
        expect(@signup.errors).to be_truthy
        expect(@signup.errors.full_messages).to eq(["Email has already been taken"])
      end
    end
  end
end


