class Course < ActiveRecord::Base
  has_and_belongs_to_many :enrollments, join_table: "enrollments", class_name: "Account"
  has_many :sessions
  belongs_to :teacher, class_name: "Account"

  mount_uploader :image, ImageUploader

  attr_accessible :body
  attr_accessible :name
  attr_accessible :price
end
