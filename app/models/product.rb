class Product < ApplicationRecord

    has_one_attached :product_image
    validates :quantity, presence: true, numericality: {greater_than_or_equals: 0}
    validates :price, presence: true, numericality:{greater_than: 0}
    
end
