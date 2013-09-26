class ReportProduct < ActiveRecord::Base
  belongs_to :earthquake
  belongs_to :product_type
end
