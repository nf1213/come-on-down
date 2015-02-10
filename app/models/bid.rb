class Bid < ActiveRecord::Base
  belongs_to :prize
  belongs_to :user
end
