module CoursesHelper
  def no_courses_text
    if params[:account_id]
      """
      You currently haven't signed up for any courses.
      Why don't you #{link_to "check out our selection", courses_path}?
      """
    else
      """
      We're not offering any courses right now.
      """
    end
  end

  def body_course_form_input_options
    {
      as: :text,
      input_html: { rows: 8 }
    }
  end

  def price_course_form_input_options
    { placeholder: "500" }
  end

  def course_availability_class
    'open' if course.available?
  end
end
