require 'rails_helper'

feature 'Admin creates a prize' do
  before(:each) do
    @admin = FactoryGirl.create(:user, admin: true)
  end

  scenario "must be an admin" do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
    visit prizes_path
    expect(page).to_not have_content "New Prize"
    visit new_admin_prize_path
    expect(page).to have_content "You are not authorized to view this resource."
  end

  scenario "provides valid attributes" do
    sign_in_as(@admin)
    visit prizes_path
    click_on "New Prize"
    fill_in "Name", with: "Car"
    click_on "Create Prize"
    expect(page).to have_content "Prize created"
  end

  scenario "provides invalid attributes" do
    sign_in_as(@admin)
    visit new_admin_prize_path
    click_on "Create Prize"
    expect(page).to have_content "Namecan't be blank"
  end
end
