class CourseDecorator < Draper::Base
  decorates :course
  decorates_association :accounts

  def start_at_date
    if sessions.any?

    else
      "---"
    end
  end

  def end_at_date
    if sessions.any?

    else
      "---"
    end
  end

end
