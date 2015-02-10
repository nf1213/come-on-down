class Bid < ActiveRecord::Base
  belongs_to :prize
  belongs_to :user

  validates :user,
    presence: true,
    uniqueness: { scope: :prize_id }
end
