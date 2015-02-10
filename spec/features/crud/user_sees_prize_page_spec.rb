require 'rails_helper'

feature 'User sees prize page', %q{

As a Launcher who is trapped in his/her house because snowpocalypse has paralyzed the City of Boston,
I want to see go to an individual prize's page
So that I can bid and come closest to the actual retail price without going over
} do

# Acceptance Criteria
# [x] I can see an individual prize's page
# [] I can see bid on the prize
# [] I can see what other people have voted

  scenario 'User sees an individual prize' do

    user = FactoryGirl.create(:user)
    prize = FactoryGirl.create(:prize)

    visit prizes_path

    click_on prize.name

    expect(page).to have_content prize.name
    expect(page).to have_content 'Place your bid'
  end

  scenario 'User can bid on prize', focus: true do

    user = FactoryGirl.create(:user)
    prize = FactoryGirl.create(:prize)
    bid = FactoryGirl.create(:bid)

    visit prize_path(prize)

    fill_in 'Bid on this prize', with bid.amount
    click_on 'Enter my bid!'

    expect(page).to have_content 'You have successfully placed your bid!'
  end

  # scenario 'User can see what others have bid', focus: true do
  #
  #   user = FactoryGirl.create(:user)
  #   prize = FactoryGirl.create(:prize)
  #   bid = FactoryGirl.create(:bid)
  #
  #   visit prize_path(prize)
  #
  #   expect(page).to have_content prize.bid.amount
  # end
end
