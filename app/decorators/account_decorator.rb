class AccountDecorator < Draper::Base
  decorates :account
  decorates_association :courses
end
