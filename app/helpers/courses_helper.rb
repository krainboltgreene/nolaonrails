module CoursesHelper
  def course_weeks
    @courses.group_by(&:week).values
  end
end
