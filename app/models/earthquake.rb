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

	def set_sources(sources)
		return  if sources.split(',').empty?
		quake_sources = sources.split(',')
			quake_sources.each  do |source|
				self.sources << Source.find_or_create_by(code: source)
			end
		self.save!
	end

	def set_types(types)
		return  if types.split(',').empty?
		product_types = types.split(',')
			product_types.each  do |name|
				self.product_types << ProductType.find_or_create_by(name: name)
			end
		self.save!
	end

	def set_coordinate(coordinates)
		raise ArgumentError, "invalid coordinates format. should be an array [longitude,latitude,depth]" unless coordinates.is_a?(Array) && coordinates.size == 3
		self.create_coordinate(longitude: coordinates[0],latitude: coordinates[1],depth: coordinates.last)
	end

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
				quake_type: properties['type']
				)
			quake.set_sources(properties['sources'])
			quake.set_types(properties['types'])
			quake.set_coordinate(properties['geometry']['coordinates'])
		end
	end


end