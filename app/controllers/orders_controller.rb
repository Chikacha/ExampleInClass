class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    #binding.pry
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @comments = @order.comments
    @comment = Comment.new
  end

  def vote
    @order = Order.find(params[:id])    
    @vote = Vote.create(voteable: @order, creator: current_user, vote: params[:vote])

    redirect_to root_path
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    # binding.pry
    @order = Order.new(order_params)
    
    if @order.save
      redirect_to @order
    else
      render :new
    end
    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to @order, notice: 'Order was successfully created.' }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :phone, :description)
    end
end
