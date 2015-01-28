class User < ActiveRecord::Base
  has_secure_password

  has_many :user_groups
  has_many :groups, through: :user_groups

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /.+@.+\..+/ }
end
