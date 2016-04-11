class Army < ActiveRecord::Base
  has_many :soldiers
  belongs_to :battle
  after_create :build_army!

  def army_attack(target)
    soldiers_remaining.sample.attack(target)
  end


  def build_army!
    infantry.times do
      FootSoldier.create(
        army_id:       id,
        cost:          15,
        health:       100,
        attack_damage: 75,
        defense:       40,
        luck:          15
      )
    end
    archers.times do
      Archer.create(
        army_id:       id,
        cost:          60,
        health:       100,
        attack_damage: 40,
        defense:       20,
        luck:          50
      )
    end
    knights.times do
      Knight.create(
        army_id:       id,
        cost:         250,
        health:       100,
        attack_damage:100,
        defense:       60,
        luck:          40
      )
    end

  end

  def soldiers_remaining
    soldiers.where("health > '0'")
  end

end
