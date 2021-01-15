class Location < ActiveRecord::Base
  has_many :profile_locations
  has_many :profiles, through: :profile_locations
    
    # serialize :location, Array
end