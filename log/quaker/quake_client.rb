require 'net/http'
module Quaker	
	class QuakeClient
		def initialize
			@url = "http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_month.geojson"
		end

		def self.get
			JSON.parse(Net::HTTP.get(@url))
		end

	end
end