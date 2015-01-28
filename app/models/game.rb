class Game < ActiveRecord::Base
  belongs_to :group
  has_many :clashes
end
