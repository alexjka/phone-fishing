require "rails_helper"

feature "user visits the login" do

  scenario "user visits root page to log in" do
    visit new_user_session_path
    expect(page).to have_content "Log in"
    expect(page).to have_content "Sign up"
  end

  scenario "user tries to log in" do
    visit root_path
    find('input[type="submit"]').click
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end
end
