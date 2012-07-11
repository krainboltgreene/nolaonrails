class Account < ActiveRecord::Base
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  serialize :stripe_charges

  has_and_belongs_to_many :enrollments, join_table: "enrollments", class_name: "Course"
  has_many :courses

  attr_accessor :terms
  attr_accessor :password, :password_confirmation
  attr_accessor :card_number, :card_cvc, :card_expiration

  attr_accessible :name
  attr_accessible :email
  attr_accessible :avatar
  attr_accessible :password, :password_confirmation
  attr_accessible :terms
  attr_accessible :stripe_token, :stripe_customer_token, :stripe_charges, :stripe_plan

  validates :email, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, length: 0..256
  validates :password, confirmation: true, length: 8..1024, if: -> { new_record? || password.present? }
  validates :name, format: /[\w\s\-\,\.]/, length: 4..1024
  validates :terms, acceptance: true
end
