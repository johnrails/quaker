class EarthquakeReport < ActiveRecord::Base
  belongs_to :earthquake
  belongs_to :source
end
