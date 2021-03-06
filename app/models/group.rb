class Group < ActiveRecord::Base
  has_many :user_groups
  has_many :users, through: :user_groups

  has_many :games
  has_many :clashes, through: :games
end
