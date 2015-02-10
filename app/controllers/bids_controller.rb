class BidsController < ApplicationController
  before_action :ensure_open

  def ensure_open
    @prize = Prize.find(params[:prize_id])
    if !@prize.open
      redirect_to prize_path(@prize), alert: "Bidding is closed, sorry."
    end
  end

  def new
    @bid = Bid.new
  end

  def create
    @prize = Prize.find(params[:prize_id])
    @bid = @prize.bids.build(bid_params)
    if @bid.save(bid_params)
      redirect_to prize_path(@prize), notice: "You have successfully placed your bid!"
    else
      redirect_to prize_path(@prize), notice: "Your bid did not save...[sad trombone]"
    end

  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :user_id)
  end
end
