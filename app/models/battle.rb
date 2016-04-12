class Battle < ActiveRecord::Base
  has_many :armies
  after_create :initiate_battle!

  def a_army
    Army.where(id: army_a).last
  end

  def b_army
    Army.where(id: army_b).last
  end

  def initiate_battle!
    while a_army.soldiers_remaining.present? && b_army.soldiers_remaining.present? do
      a_army.army_attack(b_army.soldiers_remaining)
      b_army.army_attack(a_army.soldiers_remaining)
    end
  end

  def surviving_army
    return a_army if a_army.soldier_count > b_army.soldier_count
    return b_army if b_army.soldier_count > a_army.soldier_count
  end
end
