require 'net/http'
class Earthquake < ActiveRecord::Base
	SEED_URL = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_month.geojson"
	#=============
	# associations
	#=============
	has_many :earthquake_reports
	has_many :sources, :through  =>  :earthquake_reports
	has_many :report_products
	has_one :coordinate
	has_many :product_types, :through  =>  :report_products








	protected
	def self.seed_data
		uri = URI.parse(SEED_URL)
		JSON.parse(Net::HTTP.get(uri))
	end
end
