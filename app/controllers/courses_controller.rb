class CoursesController < ApplicationController
  def index
    @courses = if params[:account_id]
      current_account.courses
    else
      CourseDecorator.decorate Course.all
    end
  end

  def show
    @course = Course.find_by_id params[:id]
  end
end
