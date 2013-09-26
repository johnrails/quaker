class Source < ActiveRecord::Base

	#=============
	# associations
	#=============
	has_many :earthquake_reports
	has_many :earthquakes, :through  => :earthquake_reports
	 
end
