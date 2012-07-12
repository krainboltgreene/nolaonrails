class AccountDecorator < Draper::Base
  decorates :account
  decorates_association :courses

  def is_teacher?(course)
    self == course.account
  end
end
