require 'spec_helper'

describe "Static pages" do
  
  describe "Home page" do
   it "should have the content 'Finance App'" do
  		visit '/'
  		expect(page).to have_content('Finance App')
  	end
  end
  
  describe "Sign_in page" do
    it "should have the content 'Sign in'" do
  	   visit '/signin'
  	   expect(page).to have_content('Sign in')
  	end
  end

  describe "Signup page" do
  	it "should have the content 'Sign up'" do
  		visit '/signup'
  		expect(page).to have_content('Sign up')
    end
  end

  describe "Contact_us page" do
  	it "should have the content 'Contact us'" do
  		visit '/contactus'
  		expect(page).to have_content('Contact us')
    end
  end
end
