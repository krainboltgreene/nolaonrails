class Course
  include Mongoid::Document

  field :title
  field :description
  field :week, type: Integer
  field :day, type: Integer

  embeds_one :resource

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

  embeds_many :links
end

class Link
  include Mongoid::Document

  embedded_in :resource

  field :name
  field :url
end
