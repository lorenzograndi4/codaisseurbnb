class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def set_total_price
    self.price = event.price * amount
  end
end
