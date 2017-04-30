require 'rails_helper'

feature "user signs in" , %Q{
  As an unauthenticated user
  I want to sign up
  So that I can see how fishing spots are producing
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
  fill_in "First Name", with: 'Joe'
  fill_in "Last Name", with: 'Smith'
  fill_in "Email", with: 'user@example.com'
  fill_in "Cell Number", with: "5085544233"
  fill_in "Password", with: 'password'
  fill_in "password Confirmation", with: 'password'
  click_button 'Sign Up'

  expect(page).to have_content("You're in!")
  expect(page).to have_content("Sign Out")
end


scenario "required information is not supplied" do

end

scenario "password confirmation does not match confirmation" do

end
  scenario "clicks sign up and fills in the fields and signs in" do
    User.create(username: "Johnboy91", email: "Highflyer87@gmail.com", password: "most_generic_pword")
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: 'Highflyer87@gmail.com'
    fill_in "Password", with: 'most_generic_pword'
    click_button "Log in"

    expect(page).to have_content 'Sign Out'
    expect(page).to_not have_content 'Sign In'
  end

  scenario "clicks sign in but fills in invalid information" do
    visit root_path

    click_link "Sign In"
    fill_in "Email", with: "bademail@false.com"
    fill_in "Password", with: "badpassword"
    click_button "Log in"

    expect(page).to have_content 'Invalid Email or password'
    expect(page).to have_content 'Sign In'
    expect(page).to_not have_content 'Sign Out'
  end
end
