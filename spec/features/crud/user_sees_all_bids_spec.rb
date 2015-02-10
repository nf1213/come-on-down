require 'rails_helper'

feature 'User sees all of the prizes', %q{

As a Launcher who is trapped in his/her house because snowpocalypse has paralyzed the City of Boston,
I want to see all of the prizes on today's episode of The Price Is Right
So that I don't go out of my everloving mind from cabin fever
} do

# Acceptance Criteria
# [x] I can see all of the prizes on the index page
# [x] I can see who won the prizes that are closed
# [x] I can see the prize price of the prizes that are closed

  scenario 'User sees all of the prizes', focus: true do

    visit prizes_path
    expect(page).to have_content prize.name
    expect(page).to have_content prize.price
    expect(page).to have_content prize.user.username
  end
end
