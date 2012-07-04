class CoursesController < ApplicationController
  def index
    @courses = if params[:account_id]
      current_account.courses
    else
      CourseDecorator.decorate Course.all
    end
  end

  def show
    @_course = Course.find_by_id params[:id]
    @course = CourseDecorator.new @_course
  end
end
