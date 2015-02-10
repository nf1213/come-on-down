class PrizesController < ApplicationController

  def index
    @open_prizes = Prize.where("open = true").order(created_at: :desc)
    @closed_prizes = Prize.where("open = false").order(created_at: :desc)
  end

  def show
    @prize = Prize.find(params[:id])
    @bid = Bid.new
  end
end
