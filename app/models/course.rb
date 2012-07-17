class Course < ActiveRecord::Base
  has_and_belongs_to_many :enrollments, join_table: "enrollments", class_name: "Account"
  has_many :meets
  belongs_to :account

  mount_uploader :image, ImageUploader

  after_save :render_body

  attr_accessible :body
  attr_accessible :name
  attr_accessible :price
  attr_accessible :enrollment_limit
  attr_accessible :location
  attr_accessible :account
  attr_accessible :image

  private

  def render_body
    Rails.cache.write "course[#{id}][body]", markdown_engine.render(body)
  end

  def markdown_engine
    engine_output = Redcarpet::Render::HTML
    engine_options = { autolink: true }
    Redcarpet::Markdown.new engine_output, engine_options
  end

end
