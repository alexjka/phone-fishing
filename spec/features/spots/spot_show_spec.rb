require "rails_helper"

feature "User views information about a specific fishing spot" do
  let(:user2) { FactoryGirl.create(:user, username: "Kenny", email: "bigmac@gmail.com") }
  let!(:spot) { FactoryGirl.create(:spot) }
  let!(:report) do
    FactoryGirl.create(:report,
    body: "great spot",
    user: user2,
    spot: spot)
  end

  scenario "User should see things about the fishing spot" do
    visit spot_path(spot)

    expect(page).to have_content spot.name
    expect(page).to have_content spot.description
  end

  scenario "User sees the most recent fishing report" do
    visit spot_path(spot)
    expect(page).to have_content report.body
  end
end
