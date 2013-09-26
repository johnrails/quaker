class ProductType < ActiveRecord::Base
  has_many :report_products
  has_many :earthquakes, :through  => :report_products
end
