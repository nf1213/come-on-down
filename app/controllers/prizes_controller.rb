class PrizesController < ApplicationController

  def index
    @prizes = Prize.all.order(created_at: :desc)
  end

  def show
    @prize = Prize.find(params[:id])
  end
end
