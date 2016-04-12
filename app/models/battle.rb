class Battle < ActiveRecord::Base
  has_many :armies
  after_create :initiate_battle!

  def initiate_battle!
    @a_army = Army.find {|a| a.id == army_a }
    @b_army = Army.find {|a| a.id == army_b }
    while @a_army.soldiers_remaining.present? && @b_army.soldiers_remaining.present? do
      @a_army.army_attack(@b_army.soldiers_remaining)
      @b_army.army_attack(@a_army.soldiers_remaining)
    end
    "#{surviving_army.name} army is victorious!"
  end

  def surviving_army
    return @a_army if @a_army.soldier_count > @b_army.soldier_count
    return @b_army if @b_army.soldier_count > @a_army.soldier_count
  end
end
