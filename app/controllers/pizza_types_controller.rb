class PizzaTypesController < ApplicationController
  before_action :set_pizza_type, only: %i[ show edit update destroy  increment decrement]
  before_action :process_cart, only: %i[index increment decrement]

  # GET /pizza_types or /pizza_types.json
  def index
    @cart = session[:cart]
    @cart_price = session[:cart_price]
    @pizza_types = PizzaType.all
  end

  # GET /pizza_types/1 or /pizza_types/1.json
  def show
  end

  # GET /pizza_types/new
  def new
    @pizza_type = PizzaType.new
  end

  # GET /pizza_types/1/edit
  def edit
  end

  def increment
    session[:cart][@pizza_type.id] += 1
    session[:cart_price] += @pizza_type.price
    redirect_to pizza_types_url
  end

  def decrement
    session[:cart][@pizza_type.id] -= 1
    session[:cart_price] -= @pizza_type.price
    redirect_to pizza_types_url
  end

  def clear
    session.delete(:cart)
    session.delete(:cart_price)
    redirect_to pizza_types_url
  end

  # POST /pizza_types or /pizza_types.json
  def create
    @pizza_type = PizzaType.new(pizza_type_params)

    respond_to do |format|
      if @pizza_type.save
        format.html { redirect_to pizza_type_url(@pizza_type), notice: "Pizza type was successfully created." }
        format.json { render :show, status: :created, location: @pizza_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pizza_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizza_types/1 or /pizza_types/1.json
  def update
    respond_to do |format|
      if @pizza_type.update(pizza_type_params)
        format.html { redirect_to pizza_type_url(@pizza_type), notice: "Pizza type was successfully updated." }
        format.json { render :show, status: :ok, location: @pizza_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pizza_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizza_types/1 or /pizza_types/1.json
  def destroy
    @pizza_type.destroy

    respond_to do |format|
      format.html { redirect_to pizza_types_url, notice: "Pizza type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza_type
      @pizza_type = PizzaType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pizza_type_params
      params.require(:pizza_type).permit(:name, :price)
    end
end
