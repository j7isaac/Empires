class Battle < ActiveRecord::Base
  has_many :armies
  after_create :initiate_battle!

  def make_attacks
    a_army.attack(b_army.soldiers_remaining)
    b_army.attack(a_army.soldiers_remaining)
  end

  def a_army
    Army.find(army_a)
  end

  def b_army
    Army.find(army_b)
  end

  def initiate_battle!
    health_reset
    make_attacks while soldiers_left_to_battle?
  end

  def health_reset
    a_army.reset_health
    b_army.reset_health
  end

  def surviving_army
    return a_army if a_army.soldier_count > b_army.soldier_count
    return b_army if b_army.soldier_count > a_army.soldier_count
  end

  def soldiers_left_to_battle?
    a_army.soldiers_remaining.present? && b_army.soldiers_remaining.present?
  end
end
