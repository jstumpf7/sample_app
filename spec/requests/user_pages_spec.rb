require 'spec_helper'

describe "UserPages" do

subject { page }


  describe "signup page" do

    before { visit signup_path }

    it {should have_content('Sign up') }
    it {should have_title(full_title('Sign Up')) }

	let(:submit) { "Create my account" }
	
	describe "with invalid information" do
		it "should not create a user" do
			expect { click_on submit }.not_to change(User, :count)
		end
	end
	
	describe "with valid information" do
		before do
			fill_in "Name",			with: "Jonathan Stumpf"
			fill_in "Email",		with: "jstumpf@gmail.com"
			fill_in "Password",		with: "yes"
			fill_in "Confirmation", with: "yes"
		end
		it "should create a user" do
			expect do
				click button submit
			end.to change(User, :count).by(1)
		end
	end
  end
  
  describe "profile page" do
	let(:user) { FactoryGirl.create(:user) }
	before { visit user_path(user) }
	
	it {should have_content(user.name)}
	it {should have_title(user.name)}
  end
end
