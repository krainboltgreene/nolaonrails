class CourseDecorator < Draper::Base
  decorates :course
  decorates_association :accounts
  decorates_association :meets

  def start_at_date
    if meets.any?

    else
      "---"
    end
  end

  def end_at_date
    if meets.any?

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
end
