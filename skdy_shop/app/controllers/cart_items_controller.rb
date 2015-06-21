class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /cart_items
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
    @menus = Menu.all
  end

  # GET /cart_items/1/edit
  def edit
    @menus = Menu.all
  end

  # POST /cart_items
  def create
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.save
      flash[:id] = @cart_item.id
      flash[:type] = 'created'
      redirect_to cart_items_url, notice: 'カートに追加しました'
    else
      render :new
    end
  end

  # PATCH/PUT /cart_items/1
  def update
    if @cart_item.update(cart_item_params)
      flash[:id] = @cart_item.id
      flash[:type] = 'updated'
      redirect_to cart_items_url, notice: 'カートを更新しました'
    else
      render :edit
    end
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
    flash[:id] = 0
    flash[:type] = 'deleted'
    redirect_to cart_items_url, notice: '削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_item_params
      params.require(:cart_item).permit(:menu_id, :cart_id, :amount)
    end
end
