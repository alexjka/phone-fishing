require "rails_helper"

feature "user sees the things on their user page" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user can visit userspage through clicking on my profile" do
    login_as(user)
    visit root_path
    click_link "My Profile"
    expect(page).to have_content "Edit or delete my profile"
  end
end
