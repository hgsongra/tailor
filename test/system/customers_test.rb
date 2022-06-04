require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "should create customer" do
    visit customers_url
    click_on "New customer"

    fill_in "City", with: @customer.city
    fill_in "Contact", with: @customer.contact
    fill_in "Name", with: @customer.name
    fill_in "Pant jang", with: @customer.pant_jang
    fill_in "Pant joro", with: @customer.pant_joro
    fill_in "Pant kamar", with: @customer.pant_kamar
    fill_in "Pant lambai", with: @customer.pant_lambai
    fill_in "Pant mori", with: @customer.pant_mori
    fill_in "Pant seat", with: @customer.pant_seat
    fill_in "Shirt baay", with: @customer.shirt_baay
    fill_in "Shirt chhati", with: @customer.shirt_chhati
    fill_in "Shirt kamar", with: @customer.shirt_kamar
    fill_in "Shirt kolar", with: @customer.shirt_kolar
    fill_in "Shirt lambai", with: @customer.shirt_lambai
    fill_in "Shirt seat", with: @customer.shirt_seat
    fill_in "Shirt shoulder", with: @customer.shirt_shoulder
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "should update Customer" do
    visit customer_url(@customer)
    click_on "Edit this customer", match: :first

    fill_in "City", with: @customer.city
    fill_in "Contact", with: @customer.contact
    fill_in "Name", with: @customer.name
    fill_in "Pant jang", with: @customer.pant_jang
    fill_in "Pant joro", with: @customer.pant_joro
    fill_in "Pant kamar", with: @customer.pant_kamar
    fill_in "Pant lambai", with: @customer.pant_lambai
    fill_in "Pant mori", with: @customer.pant_mori
    fill_in "Pant seat", with: @customer.pant_seat
    fill_in "Shirt baay", with: @customer.shirt_baay
    fill_in "Shirt chhati", with: @customer.shirt_chhati
    fill_in "Shirt kamar", with: @customer.shirt_kamar
    fill_in "Shirt kolar", with: @customer.shirt_kolar
    fill_in "Shirt lambai", with: @customer.shirt_lambai
    fill_in "Shirt seat", with: @customer.shirt_seat
    fill_in "Shirt shoulder", with: @customer.shirt_shoulder
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "should destroy Customer" do
    visit customer_url(@customer)
    click_on "Destroy this customer", match: :first

    assert_text "Customer was successfully destroyed"
  end
end
