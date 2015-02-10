class Prize < ActiveRecord::Base

  def find_winner
    bids = self.bids
    bids = bids.sort_by { |bid| bid.amount }
    winning_bid = nil
    bids.each do |bid|
      if bid <= self.amount
        winning_bid = bid
      end
    end
    if winner
      "#{winning_bid.user.username} won this round with a bid of #{winning_bid.amount}!"
    else
      travis = User.find_by_username("Travis")
      Bid.new(user: travis, prize: self, amount: 1)
      "Travis won this round with a bid of $1. Oh, and by the way, your build is broken. FAIL."
    end
  end
end
