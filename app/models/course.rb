class Course
  include Mongoid::Document

  field :title
  field :week, type: Integer
  field :day, type: Integer
  field :source_url
  field :resources, type: Hash

  embeds_one :media

  index :day, unique: true
end

class Media
  include Mongoid::Document

  embedded_in :course

  field :presentation_url
  field :video_url
  field :audio_url
end
