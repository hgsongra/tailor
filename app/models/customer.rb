class Customer < ApplicationRecord
    validates :name, :city, :contact, presence: true
    validates :contact, length: { maximum: 10 }, numericality: { only_integer: true }
    validates :pant_lambai, :pant_mori, :pant_kamar, :pant_seat, :pant_jang, :pant_joro,  presence: true
    validates :shirt_kolar, :shirt_lambai, :shirt_shoulder, :shirt_baay, :shirt_chhati, :shirt_kamar, :shirt_seat, presence: true
    
    paginates_per 10
end
