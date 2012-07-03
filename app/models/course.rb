class Course < ActiveRecord::Base
  has_many :students, class_name: "account"

  attr_accessible :body
  attr_accessible :name
  attr_accessible :price
end
