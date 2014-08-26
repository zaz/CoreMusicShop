class ProductsController < ApplicationController
  caches_page :index

  def index
    @types = Type.all
    @type_by_id = Hash[@types.collect { |t| [ t.id, t.name ] }]
    brands = Brand.select('id, name')
    @brand_by_id = Hash[brands.collect { |b| [ b.id, b.name ] }]
    if params[:type].blank?
      @products = Product.all
    else
      applicable_types = @types.select do |t|
        t.code.start_with? params[:type]
      end.map(&:id)

      @products = Product.where(type_id: applicable_types)
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
