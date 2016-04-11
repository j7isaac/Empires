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
    @victor = surviving_army(@a_army.soldier_count, @b_army.soldier_count)
  end

  def surviving_army(a, b)
    "#{@a_army.name} army is victorious!" if a > b
    "#{@b_army.name} army is victorious!" if b > a
  end

  def battle_details(army)
    "#{army} details here"
  end


end
