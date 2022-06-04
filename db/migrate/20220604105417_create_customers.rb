class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :city
      t.string :contact
      t.string :pant_lambai
      t.string :pant_mori
      t.string :pant_kamar
      t.string :pant_seat
      t.string :pant_jang
      t.string :pant_joro
      t.string :shirt_kolar
      t.string :shirt_lambai
      t.string :shirt_shoulder
      t.string :shirt_baay
      t.string :shirt_chhati
      t.string :shirt_kamar
      t.string :shirt_seat
      t.date :delivery_date

      t.timestamps
    end
  end
end
