class PlaceSerializer < ActiveModel::Serializer
  attributes :name
  has_many :earthquakes
end