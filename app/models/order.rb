class Order < ApplicationRecord
  belongs_to :product 
  belongs_to :dealer

  validates :order_price, numericality: {greater_than: 0, message: "must be of some value"}
  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if order_date.present? && order_date.past?
      errors.add(:order_date, "can't be in the past")
    end
  end  


  def convert_datetime_to_long_format
    self.order_date.to_formatted_s(:long)
end

scope :last_order, -> {order(created_at: :desc).limit(3)}

scope :last_order, -> {order(updated_at: :desc).limit(3)}



end
