class Admin::PrizesController < ApplicationController
  before_action :authorize!

  def new
    @prize = Prize.new
  end

  def create
    @prize = Prize.new(prize_params)
    if @prize.save
      redirect_to prize_path(@prize), notice: "Prize created"
    else
      render :new
    end
  end

  def update
    @prize = Prize.find(params[:id])
    @prize.update(prize_params)
    if @prize.save
      notice = @prize.find_winner
      @prize.update(open: false)
      redirect_to prize_path(@prize), notice: notice
    else
      redirect_to prize_path(@prize), alert: "Invalid input"
    end
  end

  private

  def prize_params
    params.require(:prize).permit(:name, :price, :user_id)
  end

end
