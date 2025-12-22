class AddCustomerNoAndShirtKafToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :customer_no, :string
    add_column :customers, :shirt_kaf, :decimal
  end
end
