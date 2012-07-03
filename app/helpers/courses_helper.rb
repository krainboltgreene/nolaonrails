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
end
