class Account < ActiveRecord::Base
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  serialize :stripe_charges, Array

  has_and_belongs_to_many :enrollments, join_table: "enrollments", class_name: "Course"
  has_many :courses

  validates :email, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, length: 0..256
  validates :name, format: /[\w\s\-\,\.]/, length: 4..1024
  validates :terms, acceptance: true

  attr_accessible :name
  attr_accessible :email
  attr_accessible :avatar
  attr_accessible :terms
  attr_accessible :stripe_token, :stripe_customer_token, :stripe_charges, :stripe_plan

  attr_accessor :terms
  attr_accessor :card_number, :card_cvc, :card_expiration

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.save!
    end
  end
end
