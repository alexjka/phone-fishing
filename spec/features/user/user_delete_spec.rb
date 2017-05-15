require "rails_helper"

feature "user deletes profile" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "logged in user deletes their user profile and is redirected to login page " do
    login_as(user, :scope => :user)
    visit user_path(user)

    click_link "Edit or delete my profile"
    expect(page).to have_content ("Cancel my account")
  end
end
