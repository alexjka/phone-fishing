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
scenario "user tries to sign up" do
  visit root_path
  click_link "Sign Up"
  expect(page).to have_content "Boat name or username"
  expect(page).to have_content "Email"
  expect(page).to have_content "Cell number"
  expect(page).to have_content "Password (6 characters minimum)"
  expect(page).to have_content "Password confirmation"
end


scenario "specifiying valid and required information" do
  visit root_path
  click_link "Sign Up"
  fill_in "user_username", with: 'Cold Sweat'
  fill_in "Email", with: 'user@example.com'
  fill_in "Cell number", with: "5085544233"
  fill_in "Password", with: 'password'
  fill_in "Password confirmation", with: 'password'
  find('input[type="submit"]').click

  expect(page).to have_content("Fishing Spots")
  expect(page).to have_content("Sign Out")
end


scenario "if sign up form is incomplete, I should see errors" do
  visit root_path
  click_link "Sign Up"
  find('input[type="submit"]').click
  expect(page).to have_content "Username can't be blank"
  expect(page).to have_content "Email can't be blank"
  expect(page).to have_content "Password can't be blank"
end

scenario "if user is not signed in, should not see log out" do
  visit root_path
  click_link "Sign Up"
  expect(page).to have_content "Sign Up"
  expect(page).not_to have_content "Log Out"
end

end
