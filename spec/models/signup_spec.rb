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
    context 'arguments are blank' do
      before do
        params = { user: {first_name: "",
                          last_name: "",
                          email: "",
                          password: "",
                          password_confirmation: "",
                          company: { company_name: ""}}}
        @signup = Signup.new(params)
      end

      it "can't be saved" do
        expect(@signup).to respond_to(:save)
        expect(@signup.save).to be_falsy
      end

      it 'has right errors' do
        @signup.valid?
        expect(@signup.errors.full_messages).to include("First name can't be blank",
                                                        "Last name can't be blank",
                                                        "Company name can't be blank",
                                                        "Email can't be blank",
                                                        "Password can't be blank",
                                                        "Password is too short (minimum is 8 characters)")
      end
    end

    context 'password is too short' do
      before do
        @user = create(:user, email: "example@example.com")
        params = { user: {first_name: "Joe",
                          last_name: "Doe",
                          email: "example@example.com",
                          password: "pass",
                          password_confirmation: "pass",
                          company: { company_name: "my company"}}}
        @signup = Signup.new(params)
      end

      it "can't be saved" do
        expect(@signup).to respond_to(:save)
        expect(@signup.save).to be_falsy
      end

      it 'has right error' do
        @signup.valid?
        expect(@signup.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
      end
    end
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
      end

      it "can't be saved" do
        expect(@signup).to respond_to(:save)
        expect(@signup.save).to be_falsy
      end

      it 'has right error' do
        @signup.valid?
        expect(@signup.errors.full_messages).to include("Email has already been taken")
      end
    end
  end
  context 'company is already exist' do
    before do
      @company = create(:company, name: "The company")
      params = { user: {first_name: "Joe",
                        last_name: "Doe",
                        email: "example@example.com",
                        password: "password",
                        password_confirmation: "password",
                        company: { company_name: "the Company"}}}
      @signup = Signup.new(params)
    end

    it "can be saved" do
      expect(@signup).to respond_to(:save)
      expect(@signup.save).to be_truthy
    end

    it "doesn't create other company" do
      @signup.save
      expect(@signup.company).to eq(@company)
    end
  end
end


