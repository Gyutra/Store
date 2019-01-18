class ProductsController < ApplicationController
	before_action :set_post, only: %i[show edit update destroy]

  def index
		@product = Product.all
	end

	def show; end

	def new
		@category = Category.find(params[:category_id])
    @product = Product.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @product }
		end
	end

	def edit; end

	def create
    @category = Category.find(params[:category_id])
		@product = @category.products.new(product_params)

		if @product.save
			# redirect_to [@category, @product]
			redirect_to @category
    else
      format.html { render :new }
      format.json { render json: @product.errors, status: :unprocessable_entity }
    end
	end

	def update

		if @product.update(product_params)
		redirect_to [@category, @product]
		else
		render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		redirect_to products_path
	end

	private

	def product_params
		params.require(:product).permit(:name, :image)
	end

	def set_list
		@category = Category.find(params[:category_id])
		@product = @category.products.find(params[:id])
	end
end
