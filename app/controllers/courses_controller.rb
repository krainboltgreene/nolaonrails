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
    @_course = current_user.courses.build
    @course = CourseDecorator.new @_course
  end

  def edit
    @_course = current_user.courses.find_by_id params[:id]
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

  def update
    @_course = current_user.courses.find_by_id params[:id]
    @course = CourseDecorator.new @_course
    if @_course.update_attributes params[:course]
      redirect_to account_courses_path current_user
    else
      render :edit
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
    logger.info "Charging the current account:"
    logger.info "  account: #{current_account.to_yaml}"
    logger.info "  charge: #{charge_attributes.to_yaml}"
    charge = Stripe::Charge.create charge_attributes
    logger.info "  result: #{charge.to_json}"
    if charge.paid
      current_user.stripe_charges << charge.id
      current_user.save
      redirect_to account_courses_path current_user
    else
      flash.now[:error] = "Your card charge didn't work. Check your card information please."
      render :show
    end
  end
end
