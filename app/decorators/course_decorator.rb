class CourseDecorator < ApplicationDecorator
  decorates :course


  def slide
    resource.slide || "#"
  end

  def source
    resource.source || "#"
  end

  def video
    resource.video || "#"
  end

  def audio
    resource.audio || "#"
  end

  def links
    resource.links
  end
end
