require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference("Customer.count") do
      post customers_url, params: { customer: { city: @customer.city, contact: @customer.contact, name: @customer.name, pant_jang: @customer.pant_jang, pant_joro: @customer.pant_joro, pant_kamar: @customer.pant_kamar, pant_lambai: @customer.pant_lambai, pant_mori: @customer.pant_mori, pant_seat: @customer.pant_seat, shirt_baay: @customer.shirt_baay, shirt_chhati: @customer.shirt_chhati, shirt_kamar: @customer.shirt_kamar, shirt_kolar: @customer.shirt_kolar, shirt_lambai: @customer.shirt_lambai, shirt_seat: @customer.shirt_seat, shirt_shoulder: @customer.shirt_shoulder } }
    end

    assert_redirected_to customer_url(Customer.last)
  end

  test "should show customer" do
    get customer_url(@customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_url(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { city: @customer.city, contact: @customer.contact, name: @customer.name, pant_jang: @customer.pant_jang, pant_joro: @customer.pant_joro, pant_kamar: @customer.pant_kamar, pant_lambai: @customer.pant_lambai, pant_mori: @customer.pant_mori, pant_seat: @customer.pant_seat, shirt_baay: @customer.shirt_baay, shirt_chhati: @customer.shirt_chhati, shirt_kamar: @customer.shirt_kamar, shirt_kolar: @customer.shirt_kolar, shirt_lambai: @customer.shirt_lambai, shirt_seat: @customer.shirt_seat, shirt_shoulder: @customer.shirt_shoulder } }
    assert_redirected_to customer_url(@customer)
  end

  test "should destroy customer" do
    assert_difference("Customer.count", -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
