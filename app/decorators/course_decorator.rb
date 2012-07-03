class CourseDecorator < Draper::Base
  decorates :course
  decorates_association :accounts
end
