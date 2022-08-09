class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :process_cart, only: %i[new create]

  # GET /orders or /orders.json
  def index
    @orders = Order.includes(order_items: :pizza_type).order(created_at: :desc)
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order_items = @order.order_items.includes(:pizza_type)
  end

  # GET /orders/new
  def new
    @order = Order.new
    @cart_price = session[:cart_price]
    @cart = session[:cart]
    @pizza_types = PizzaType.where(id: @cart.keys)
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @cart = session[:cart]
    @order = Order.new
    @cart.each_pair do |key, value|
      @order.order_items.new(pizza_type_id: key, quantity: value)
    end

    respond_to do |format|
      if @order.save
        session.delete(:cart)
        session.delete(:cart_price)
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update({})
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
end
