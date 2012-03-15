class Course
  include Mongoid::Document

  field :title
  field :description
  field :week, type: Integer
  field :day, type: Integer

  embeds_one :resource
  embeds_many :links

  index :title, unique: true
  index :day, unique: true
end

class Resource
  include Mongoid::Document

  embedded_in :course

  field :slide
  field :source
  field :video
  field :audio

end

class Link
  include Mongoid::Document

  embedded_in :course

  field :name
  field :url
end
