class Product < ApplicationRecord
    has_many :orders,  dependent: :destroy 
    has_many :dealers, through: :orders
end
