class KlassDecorator < Draper::Base
  decorates :klass
  decorates_association :courses
end
