require 'net/http'
class Earthquake < ActiveRecord::Base
	SEED_URL = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_month.geojson"
	#=============
	# associations
	#=============
	has_many :earthquake_reports
	has_many :sources, :through  =>  :earthquake_reports
	has_many :report_products
	has_many :product_types, :through  =>  :report_products
	belongs_to :place

	#=======
	# Scopes
	#=======
	scope :last_fifteen , -> {where(time: 15.days.ago.beginning_of_day..Date.today).order('magnitude DESC')}

	#===============
	# class methods
	#==============

	def self.most_dangerous(count,days,region,us)
		Earthquake.find_by_sql('Select places.name, AVE(earthquakes.magnitude) from Places INNER JOIN earthquakes on places.id = earthquakes.place_id GROUP BY places.name ORDER BY AVE(earthquakes.magnitude)')
		Earthquake.avearage('magnitude').joins('INNER JOIN places on earthquakes.place_id=places.id where places.is_us=1')
	end

	# def close_by(coordinates)
	# 	SELECT id, ( 3959 * acos( cos( radians(18.21) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians(-68.88) ) + sin( radians(18.21) ) * sin( radians( latitude ) ) ) ) AS distance FROM coordinates HAVING distance < 25 ORDER BY distance LIMIT 0 , 20;
	# end
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

	# def set_coordinate(place,coordinates)
	# 	raise ArgumentError, "invalid coordinates format. should be an array [longitude,latitude,depth]" unless coordinates.is_a?(Array) && coordinates.size == 3
	# 	self.create_location(longitude: coordinates[0],latitude:coordinates[1], depth:coordinates.last, place: parse_place(place), is_us: is_us?(parse_place(place)))
	# end

	def set_place(string)
		place = Place.find_or_create_by(name: parse_place(string))
		puts Place.is_us?(string)
		puts "THE PLACE STRING IS #{string}"
		Place.is_us?(string)
		place.update_attribute(:is_us,Place.is_us?(parse_place(string)))
		self.update_attribute(:place_id,place.id)
	end

	def parse_place(place_str)
		if place_str.include?(',')
			place_str.split(',').last.strip
		else
			place_str
		end
	end


	protected


	# initial seeding of earthquake data
	def self.seed_data
		uri = URI.parse(SEED_URL)
		quakes = JSON.parse(Net::HTTP.get(uri))
		quakes["features"].each do |feature|
			properties = feature['properties']
			quake = Earthquake.create(
				magnitude: properties['mag'],
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
				quake_type: properties['type'],
				latitude: feature['geometry']['coordinates'][1],
				longitude: feature['geometry']['coordinates'][0],
				depth: feature['geometry']['coordinates'][2]
				)
			#quake.set_sources(properties['sources'])
			#quake.set_types(properties['types'])
			quake.set_place(properties['place'])
		end
	end

end