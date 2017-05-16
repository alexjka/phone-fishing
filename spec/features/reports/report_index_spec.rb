require "rails_helper"

feature "User visits the a fishing spot page" do
  let(:user2) { FactoryGirl.create(:user, username: "Kenny", email: "bigmac@gmail.com") }
  let!(:spot) { FactoryGirl.create(:spot) }
  let!(:report) do
    FactoryGirl.create(:report,
    body: "great spot",
    user: user2,
    spot: spot)
  end
  let!(:first_report) do
    FactoryGirl.create(:report,
      user: user2,
      body: "Wow the fishing here is great",
      spot: spot)
  end
  let!(:best_report) do
    FactoryGirl.create(:report,
      user: user2,
      body: "ooh, super rocky, lost an anchor - there goes next weeks pay",
      spot: spot)
  end

  scenario "User sees all the reports for a particular fishing spot" do
    visit spot_path(spot)

    expect(page).to have_content first_report.body
    expect(page).to have_content best_report.body
  end
end
