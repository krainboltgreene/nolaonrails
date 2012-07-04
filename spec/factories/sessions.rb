# Read about factories at https://github.com/thoughtbot/factory_girl
# id: integer,
# start_at: datetime,
# end_at: datetime,
# name: string,
# body: text,
# course_id: integer,
# created_at: datetime,
# updated_at: datetime

FactoryGirl.define do
  factory :session do
    name {  }
    body {  }
    start_at {  }
    end_at {  }
  end
end
