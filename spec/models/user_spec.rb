require 'spec_helper'

#Tests for validation

describe User do

	before do 
		 @user = User.new(name: "Example User", email: "user@example.com", password: "partytoextreme", password_confirmation: "partytoextreme")
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:authenticate) }

	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a" * 16 }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@test,com user_at_test.com name.user@testcom. test@say_wrong.com user@test+say.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect (@user).should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@test.COM M_LIGHT-TIME@t.n.org test.best@break.co.uk t+a@veggie.split]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect (@user).should be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end
		it { should_not be_valid}
	end

	describe "when password is not present" do
		before do
			@user = User.new(name: "Example User", email: "user@example.com", password: " ", password_confirmation: " ")
		end
	    it { should_not be_valid}
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe ""
end
