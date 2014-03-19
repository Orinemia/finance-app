require 'spec_helper'

describe "Static pages" do
  
  describe "Home page" do

  	it "should have the content 'Finance App'" do
  		visit '/static_pages/Home'
  		expect(page).to have_content('Finance App')
  	end
  end
  
  describe "Sign_in page" do
    it "should have the content 'Sign in'" do
  	   visit '/static_pages/Sign_in'
  	   expect(page).to have_content('Sign in')
  	end
  end

  describe "Sign_up page" do
  	it "should have the content 'Sign up'" do
  		visit '/static_pages/Sign_up'
  		expect(page).to have_content('Sign up')
    end
  end

  describe "Contact_us page" do
  	it "should have the content 'Contact us'" do
  		visit '/static_pages/Contact_us'
  		expect(page).to have_content('Contact us')
    end
  end

 end
