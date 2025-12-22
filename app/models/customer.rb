class Customer < ApplicationRecord
    validates :customer_no, presence: true, uniqueness: { message: "આ ગ્રાહક નંબર પહેલેથી જ ઉપલબ્ધ છે" }
    validates :name, :city, :contact, presence: true
    validates :contact, length: { maximum: 10 }, numericality: { only_integer: true }
    validates :pant_lambai, :pant_mori, :pant_kamar, :pant_seat, :pant_jang, :pant_joro,  presence: true
    validates :shirt_kolar, :shirt_lambai, :shirt_shoulder, :shirt_baay, :shirt_chhati, :shirt_kamar, :shirt_seat, :shirt_kaf, presence: true
    validate :delivery_date_must_be_in_future, if: -> { delivery_date.present? }
    
    paginates_per 10

    private

    def delivery_date_must_be_in_future
        if delivery_date < Date.current
            errors.add(:delivery_date, "ભવિષ્યની તારીખ હોવી જોઈએ")
        end
    end
end
