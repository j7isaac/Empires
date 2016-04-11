class Battle < ActiveRecord::Base
  has_many :armies
  after_create :initiate_battle!

  def initiate_battle!
    a_army = Army.find {|a| a.id == army_a }
    b_army = Army.find {|a| a.id == army_b }
    #@army = Army.find(id: army_a)
    
    while a_army.soldiers_remaining.present? && b_army.soldiers_remaining.present? do
      a_army.army_attack(b_army.soldiers_remaining)
      b_army.army_attack(a_army.soldiers_remaining)
    end
    victor(a_army.soldiers_remaining, b_army.soldiers_remaining)
    #defeated_army(a_army.soldiers_remaining, b_army.soldiers_remaining)

  end

  def random_army
    [army_a, army_b].sample
  end

  def victor(a, b)
    "#{a_army.name} won!" if a.count > b.count
    "#{b_army.name} won!" if b.count > a.count
  end


end
