class Group < ApplicationRecord
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  validates :name, :description, :user, presence: true

  validates :name, length: { minimum: 5 }

  validates :description, length: { minimum: 10 }
end
