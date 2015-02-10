class PrizesController < ApplicationController

  def index
    @prizes = Prize.all.order(created_at: :desc)
  end

end
