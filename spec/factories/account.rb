# Read about factories at https://github.com/thoughtbot/factory_girl
# id: integer,
# name: string,
# email: string,
# crypted_password: string,
# salt: string,
# activation_state: string,
# activation_token: string,
# activation_token_expires_at: datetime,
# reset_password_token: string,
# reset_password_token_expires_at: datetime,
# reset_password_email_sent_at: datetime,
# remember_me_token: string,
# remember_me_token_expires_at: datetime,
# last_login_at: datetime,
# last_logout_at: datetime,
# last_activity_at: datetime,
# unlock_token: string,
# failed_logins_count: integer,
# lock_expires_at: datetime,
# stripe_token: string,
# stripe_customer_token: string,
# stripe_plan: integer,
# uid: string,
# provider: string,
# created_at: datetime,
# updated_at: datetime,
# course_id: integer

FactoryGirl.define do
  factory :account do
    name { Forgery(:name).full_name }
    email { Forgery(:internet).email_address }
    password { Forgery(:basic).password at_least: 8, at_most: 1024 }
    password_confirmation { |a| a.password }

    factory :teacher do

    end

    factory :student do

    end
  end
end

