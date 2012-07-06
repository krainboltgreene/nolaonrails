class MeetDecorator < Draper::Base
  decorates :meet
  decorates_association :courses
end
