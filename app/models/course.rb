class Course < ActiveRecord::Base
  has_and_belongs_to_many :students, class_name: "account"

  attr_accessible :body
  attr_accessible :name
  attr_accessible :price
end
