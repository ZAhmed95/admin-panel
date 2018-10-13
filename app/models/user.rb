class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, message: "A user already exists with this email."
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: "Email format is invalid."
end