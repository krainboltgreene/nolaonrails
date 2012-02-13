class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include BCrypt

  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation
  attr_accessible :email, :password, :name, :terms

  field :email
  field :crypted_password
  field :name
  field :role, type: Integer, default: 1
  field :terms, type: Boolean, default: false

  index :email, unique: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    length: 0..256
  validates :password,
    presence: true,
    confirmation: true,
    length: 8..256
  validates :name,
    presence: true,
    format: /[\w\s\-\,\.]/,
    length: 4..256
  validates :terms,
    acceptance: { accept: true }
  validates :role,
    numericality: { only_integer: true },
    inclusion: 0..3

  before_create :convert_terms

  def avatar
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=32"
  end

  private
    def convert_terms
        self.terms = true if terms == "1" || terms == true
    end
end
