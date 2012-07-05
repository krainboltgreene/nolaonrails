# Read about factories at https://github.com/thoughtbot/factory_girl
# id: integer,
# name: string,
# body: text,
# price: integer,
# created_at: datetime,
# updated_at: datetime

FactoryGirl.define do
  factory :course do
    name { Forgery(:lorem_ipsum).words(5, random: true) }
    body { Forgery(:lorem_ipsum).paragraphs }
    price { Forgery(:monetary).money min: 25, max: 10000 }
  end
end
