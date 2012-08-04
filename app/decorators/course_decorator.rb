class CourseDecorator < Draper::Base
  decorates :course
  decorates_association :account

  def body
    Rails.cache.read("course[#{id}][body]") || course.body
  end

  def start_at_date
    if klasses.any?

    else
      "---"
    end
  end

  def end_at_date
    if klasses.any?

    else
      "---"
    end
  end

  def student_avatars
    if enrollments.any?

    else
      "---"
    end
  end

  def available?
    published? && !finished?
  end
end
