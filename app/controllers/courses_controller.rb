class CoursesController < ApplicationController
  before_filter :require_login, only: [:edit, :new]
  before_filter :new_course, only: [:new, :create]
  before_filter :find_course, only: [:show, :edit, :update]
  before_filter :find_courses, only: [:index]
  before_filter :decorate_course, only: [:show, :edit, :index]
  before_filter :decorate_courses, only: [:index]

  # GET /courses
  # GET /courses.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private

  def new_course
    @course = Course.new params[:course]
  end

  def find_course
    if params[:id].present?
      @course = Course.find_by_id params[:id]
      redirect_to new_courses_path unless @course.present?
    else
      redirect_back
    end
  end

  def find_courses
    @courses = Course.all
  end

  def decorate_course
    @course = CourseDecorator.new @course if @course.present?
  end

  def decorate_courses
    @courses = CourseDecorator.new @courses if @courses.present?
  end
end
