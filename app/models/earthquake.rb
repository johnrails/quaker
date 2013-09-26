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
		quakes = JSON.parse(Net::HTTP.get(uri))
		quakes["features"].each do |feature|
			properties = feature['properties']
			quake = Earthquake.create(
				magnitude: properties['mag'],
				place: properties['place'],
				time: Time.at((properties['time']/1000)),
				url: properties['url'],
				detail_url: properties['detail'],
				felt: properties['felt'],
				cdi: properties['cdi'],
				mmi: properties['mmi'],
				alert: properties['alert'],
				status: properties['status'],
				tsumani: properties['tsunami'],
				sig: properties['sig'],
				code: properties['code'],
				nst: properties['nst'],
				dmin: properties['dmin'],
				gap: properties['gap'],
				mag_type: properties['magType'],
				type: properties['type']
				)
			set_sources(quake,properties['sources'])
		end
	end
	def set_sources(sources)
		return  if sources.split(',').empty?
		quake_sources = sources.split(',')
			quake_sources.each  do |source|
				self.sources << Source.find_or_create_by_code(sources)
			end
		self.save!
	end

	def set_coordinate(coordinates)
		raise ArgumentException, "invalid coordinates format. should be an array [longitude,latitude,depth]" unless coordinates.is_a(Array) && coordinates.size <= 3
		self.coordinate.create(longitude: coordinates[0],latitude: coordinates[1],depth: coordinates.last)
	end
end