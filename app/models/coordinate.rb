class Coordinate < ActiveRecord::Base
  #=============
  # associations
  # =============
  belongs_to :earthquake

  #=============
  # validations
  #=============
  validates :logitude, numericality: { only_integer: false }
  validates :latitude, numericality: { only_integer: false }
  validates :depth, numericality: { only_integer: false }

end
