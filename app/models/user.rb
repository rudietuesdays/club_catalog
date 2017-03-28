class User < ApplicationRecord
  has_secure_password
  has_many :groups
  has_many :memberships

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  before_save :downcase_fields
  before_create validates :password, length: { minimum: 8 }

  validates :first_name, :last_name, :email, presence: true

  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  def downcase_fields
    self.email.downcase!
  end
end
