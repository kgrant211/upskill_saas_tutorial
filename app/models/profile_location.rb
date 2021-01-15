class ProfileLocation < ActiveRecord::Base
  belongs_to :profile
  belongs_to :location
  validates_presence_of :profile
  validates_presence_of :location

  accepts_nested_attributes_for :location

end