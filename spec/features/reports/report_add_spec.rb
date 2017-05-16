require "rails_helper"

feature "User visits the new report page" do
  let(:user2) { FactoryGirl.create(:user, username: "Kenny", email: "bigmac@gmail.com") }
  let!(:spot) { FactoryGirl.create(:spot) }
  let!(:report) do
    FactoryGirl.create(:report,
    body: "great spot",
    user: user2,
    spot: spot)
  end

  feature "User visits the new report page" do
    scenario "Logged in user sees a form to enter a fishing report" do
      login_as(user2)
      visit new_spot_report_path(spot)

      expect(page).to have_content "Your fishing report"
      expect(page).to have_xpath "//input"
    end
  end

  feature "User submits a fishing report on a spot" do
    scenario "User successfully submits a report" do
      login_as(user2)
      visit new_spot_report_path(spot)
      fill_in 'report_body', with: "This spot has consistantly raised fish"
      click_button 'Add a report'
      expect(page).to have_content "This spot has consistantly raised fish"
    end
  end
end
