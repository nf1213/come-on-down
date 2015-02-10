class Bid < ActiveRecord::Base
  belongs_to :prize
  belongs_to :user

  validates :user,
    presence: true,
    uniqueness: { scope: :prize_id }

    validates_numericality_of :amount, greater_than_or_equal_to: 1
    validates :amount, uniqueness: { scope: :prize_id }
end
