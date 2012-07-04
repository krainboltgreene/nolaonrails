# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Account.delete_all
Course.delete_all
Session.delete_all

teachers = (1..rand(10..100)).map do
  teacher = FactoryGirl.create :teacher
  courses = (1..rand(1..5)).map do
    course = FactoryGirl.create :course
    students = (0..rand(0..10)).map do
      FactoryGirl.create :student
    end
    course.enrollments << students
    course
  end
  teacher.courses << courses
end
