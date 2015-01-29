class Game < ActiveRecord::Base
  belongs_to :group
  has_many :clashes

  def get_leader
    winners = []
    self.clashes.each {|clash| winners << clash.winner}
    leader = winners.group_by {|i| i}.max_by {|k, v| v.count }[0]
  end
end
