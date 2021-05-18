class Dealer < ApplicationRecord
    has_many :orders
    has_many :products, through: :orders
    validates :dealer_name, uniqueness: { case_sensitive: false }

validates :dealer_name, presence: true


    def number_of_orders
        self.orders.count
    end


scope :alpha, -> {order('dealer_name')}



end
