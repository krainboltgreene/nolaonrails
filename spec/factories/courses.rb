# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "MyString"
    body "MyText"
    price 1
    account nil
  end
end
