class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :role_users
  has_many :users, through: :role_users
end
