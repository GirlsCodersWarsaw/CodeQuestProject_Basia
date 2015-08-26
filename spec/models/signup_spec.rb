require 'rails_helper'

describe Signup do
  context 'with proper params' do
    before do
      @params = { user: {first_name: "Joe",
                         last_name: "Doe",
                         email: "example@example.com",
                         password: "password",
                         password_confirmation: "password",
                         company: { company_name: "my company"}}}
      @signup = Signup.new(@params)
    end

    it 'is valid' do
      expect(@signup).to be_valid
    end

    context 'when company is already exist' do
      before do
        @company = create(:company, name: "MY comPany")
        @signup = Signup.new(@params)
      end

      it "is valid" do
        expect(@signup).to be_valid
      end

      it "doesn't create other company" do
        @signup.save
        expect(@signup.company).to eq(@company)
      end
    end
  end

  context 'with wrong params' do
    context 'when arguments are blank' do
      before do
        params = { user: {first_name: "",
                          last_name: "",
                          email: "",
                          password: "",
                          password_confirmation: "",
                          company: { company_name: ""}}}
        @signup = Signup.new(params)
      end

      it "is invalid" do
        expect(@signup).to be_invalid
      end

      it 'has right errors' do
        @signup.valid?
        expect(@signup.errors[:first_name]).to_not be_nil
        expect(@signup.errors[:last_name]).to_not be_nil
        expect(@signup.errors[:company]).to_not be_nil
        expect(@signup.errors[:email]).to_not be_nil
        expect(@signup.errors[:password]).to_not be_nil
      end
    end

    context 'when password is too short' do
      before do
        params = { user: {first_name: "Joe",
                           last_name: "Doe",
                           email: "example@example.com",
                           password: "pass",
                           password_confirmation: "pass",
                           company: { company_name: "my company"}}}
        @signup = Signup.new(params)
      end

      it "is invalid" do
        expect(@signup).to be_invalid
      end

      it 'has right error' do
        @signup.valid?
        expect(@signup.errors[:password]).to_not be_nil
      end
    end
    context 'when email has already been taken' do
      before do
        params = { user: {first_name: "Joe",
                           last_name: "Doe",
                           email: "example@example.com",
                           password: "password",
                           password_confirmation: "password",
                           company: { company_name: "my company"}}}
        @signup = Signup.new(params)
        user_email = 'EXAmple@exampLe.com'
        User.new(email: user_email)
        User.stub(:where).with("lower(email) = ?", user_email.downcase) {["user"]}
      end

      it "is invalid" do
        expect(@signup).to be_invalid
      end

      it 'has right error' do
        @signup.valid?
        expect(@signup.errors[:email]).to_not be_nil
      end
    end
  end
end
