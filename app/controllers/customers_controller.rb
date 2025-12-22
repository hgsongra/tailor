class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    search_query = "%#{params[:query]&.downcase}%"
    @customers = Customer.where('LOWER(name) LIKE :q OR LOWER(city) LIKE :q OR LOWER(contact) LIKE :q OR customer_no LIKE :q', q: search_query).page(params[:page] || 1)
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "નવો ગ્રાહક સફળતાપૂર્વક બનાવવામાં આવ્યો છે." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "ગ્રાહકની વિગતો સફળતાપૂર્વક અપડેટ કરવામાં આવી છે." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "ગ્રાહકને સફળતાપૂર્વક દૂર કરવામાં આવ્યો." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:customer_no, :name, :city, :contact, :pant_lambai, :pant_mori, :pant_kamar, :pant_seat, :pant_jang, :pant_joro, :shirt_kolar, :shirt_lambai, :shirt_shoulder, :shirt_baay, :shirt_chhati, :shirt_kamar, :shirt_seat, :shirt_kaf, :delivery_date, :notes)
    end
end
