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

  def new
    @_course = Course.new
    @course = CourseDecorator.new @_course
  end

  def create
    @_course = current_user.courses.build params[:course]
    @course = CourseDecorator.new @_course
    if @_course.valid?
      @_course.save
      redirect_to account_courses_path current_user
    else
      render :new
    end
  end

  def purchase
    @_course = Course.find_by_id params[:id]
    @course = CourseDecorator.new @_course
    charge_attributes = {
      amount: @course.price,
      currency: "usd",
      customer: current_account.stripe_customer_token
    }

    Stripe::Charge.create charge_attributes
  end
end
