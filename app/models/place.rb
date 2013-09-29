class Place < ActiveRecord::Base
  has_many :earthquakes
  #=======
  # Scopes
  #=======
  scope :in_us, where(is_us: true)

  def self.most_dangerous
    Place.find_by_sql('SELECT p.name, AVG(e.magnitude) FROM places p INNER JOIN earthquakes e ON p.id = e.place_id GROUP BY p.name order by AVG(e.magnitude) desc')
  end
  def self.is_us?(state)
    !State.where('lower(state_full)= ?', state.downcase).first.nil?
  end

  def average_quakes
    # get all places in the us and the average size earthquakes, ordered by magnitude desc
  end
end
