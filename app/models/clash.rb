class Clash < ActiveRecord::Base
  belongs_to :game

  def winner_name
    User.find(self.winner).name
  end

  def runner_up_name
    User.find(self.runner_up).name
  end

  def fool_name
    User.find(self.fool).name
  end

  def date
    month = self.created_at.month
    day   = self.created_at.day
    year  = self.created_at.year
    "#{month}/#{day}/#{year}"
  end

  def current_user_won?
  end

end
