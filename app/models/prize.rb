class Prize < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates :name,
    presence: true

  def find_winner
    bids = self.bids.order(:amount)
    winning_bid = nil
    bids.each do |bid|
      if bid.amount <= self.price
        winning_bid = bid
      end
    end
    if winning_bid
      "#{winning_bid.user.username} won this round with a bid of #{winning_bid.amount}!"
    else
      travis = User.find_by_username("Travis")
      Bid.new(user: travis, prize: self, amount: 1)
      "Travis won this round with a bid of $1. Oh, and by the way, your build is broken. FAIL."
    end
  end
end
