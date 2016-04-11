class Battle < ActiveRecord::Base
  has_many :armies
  after_create :initiate_battle!

  def initiate_battle!

  end

  def random_army
    [army_a, army_b].sample
  end
end
