class ProductsController < ApplicationController
  caches_page :index

  def index
    @types = Type.select('id, name, parent_id')
    @type_by_id = Hash[@types.collect { |t| [ t.id, t.name ] }]
    brands = Brand.select('id, name')
    @brand_by_id = Hash[brands.collect { |b| [ b.id, b.name ] }]
    if params[:type].blank?
      @products = Product.all
    else
      type_path = ( CGI.unescape params[:type].gsub('_', ' ') ).split('/')

      current = nil
      for type in type_path
        current = @types.select do |t|
          t.parent_id == current and t.name == type
        end.map(&:id).first
      end
      return @products = [] if current.nil?

      applicable_types = [ [ current ] ]
      until applicable_types.last.empty? do
        applicable_types << applicable_types.last.map do | a_type |
          @types.select { |t| t.parent_id == a_type }.map(&:id)
        end .flatten
      end
      applicable_types.flatten!

      @products = Product.select { |p| applicable_types.include? p.type_id }
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully added.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def product_params
      # XXX: May need to use `:type_id`
      params.require(:product).permit(:name, :price, :type)
    end
end
