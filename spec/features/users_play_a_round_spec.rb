require 'rails_helper'

feature 'Users play a round' do
  before(:each) do
    @contestant1 = FactoryGirl.create(:user)
    @contestant2 = FactoryGirl.create(:user)
    @travis = FactoryGirl.create(:user, username: "Travis", admin: true)
    sign_in_as(@travis)
    @prize = FactoryGirl.create(:prize)
  end

  scenario 'a user wins by picking bidding the closest without going over' do
    FactoryGirl.create(:bid, user: @contestant1, amount: 900, prize: @prize)
    win = FactoryGirl.create(:bid, user: @contestant2, amount: 800, prize: @prize)
    visit prize_path(@prize)
    fill_in "Price", with: 899
    click_on "Update Prize"

    expect(page).to have_content "#{@contestant2.username} won this round with a bid of #{win.amount}!"
  end

  scenario 'all users go over' do
    win = FactoryGirl.create(:bid, user: @contestant1, amount: 800, prize: @prize)
    FactoryGirl.create(:bid, user: @contestant2, amount: 900, prize: @prize)
    visit prize_path(@prize)
    fill_in "Price", with: 700
    click_on "Update Prize"

    expect(page).to have_content "Travis won this round with a bid of $1. Oh, and by the way, your build is broken. FAIL."
  end

  scenario 'nobody bids' do
    visit prize_path(@prize)
    fill_in "Price", with: 700
    click_on "Update Prize"

    expect(page).to have_content "Travis won this round with a bid of $1. Oh, and by the way, your build is broken. FAIL."
  end
end
