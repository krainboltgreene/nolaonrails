class CoursesController < ApplicationController
  def index
    @courses = if params[:account_id]
      current_account.courses
    else
      Course.all
    end
  end

  def show
    @courses = Course.find_by_id params[:id]
  end
end
