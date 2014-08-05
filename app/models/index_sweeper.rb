class IndexSweeper < ActiveRecord::Observer
  observe Product, Brand, Type

  def after_save(record)
    ApplicationController.expire_page('/index.html')
  end
end
