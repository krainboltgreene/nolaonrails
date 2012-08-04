class Klass < ActiveRecord::Base
  belongs_to :course

  attr_accessible :name
  attr_accessible :body
  attr_accessible :location
  attr_accessible :longitude
  attr_accessible :latitude
  attr_accessible :start_at
  attr_accessible :end_at
  attr_accessible :course
end
