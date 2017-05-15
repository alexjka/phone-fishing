require 'rails_helper'

feature "user signs in" , %Q{
  As an unauthenticated user
  I want to sign up
  So that I can see what fishing spots are producing
} do
  # ACCEPTANCE CRITERIA
  # When I visit the page I want to a link that allows me to sign in
  # When I valid email and password, I should see a message that I've
  # successfully signed in
  # When I enter invalid information I should receive an error message and not
  # be signed in
  # When I've signed in I should be able to access authenticated user actions
scenario "specifiying valid and required information" do
  visit root_path
  click_link "Sign Up"
  fill_in "First name", with: 'Joe'
  fill_in "Last name", with: 'Smith'
  fill_in "Email", with: 'user@example.com'
  fill_in "Cell number", with: "5085544233"
  fill_in "Password", with: 'password'
  fill_in "Password confirmation", with: 'password'
  click_button 'Sign Up'

  expect(page).to have_content("You're in!")
  expect(page).to have_content("Sign Out")
end


scenario "required information is not supplied" do

end

scenario "password confirmation does not match confirmation" do

end
end
