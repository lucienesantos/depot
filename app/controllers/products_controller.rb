class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit

  end  

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.'}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new}
        format.json { render json: @product.errors, status: :unprocessable_entity}
      end  
    end  
  end 

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.'}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :edit}
        format.json { render json: @product.errors, status: :unprocessable_entity}
      end  
    end  
  end  

  private 

  def set_product
    @product = Product.find(params[:id])
  end  

  def product_params
    #params.fetch(:product, {:title, :description, :image_url, :price})
    params.require(:product).permit(:title, :description, :image_url, :price)
  end

end