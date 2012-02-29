class CourseDecorator < ApplicationDecorator
  decorates :course


  def slide
    resources.slide || "#"
  end

  def source
    resources.source || "#"
  end

  def video
    resources.video || "#"
  end

  def audio
    resources.audio || "#"
  end

  def links
    resources.links
  end
end
