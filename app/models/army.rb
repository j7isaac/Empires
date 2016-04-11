class Army < ActiveRecord::Base
  has_many :soldiers
  after_create :build_army!

  def build_army!
    infantry.times do
      FootSoldier.create(
        army_id:       id,
        cost:          15,
        health:       100,
        attack_damage: 20,
        defense:       30,
        luck:          15
      )
    end
    archers.times do
      Archer.create(
        army_id:       id,
        cost:          60,
        health:       100,
        attack_damage: 12,
        defense:       15,
        luck:          22
      )
    end
    knights.times do
      Knight.create(
        army_id:       id,
        cost:         250,
        health:       100,
        attack_damage: 75,
        defense:       60,
        luck:          40
      )
    end

  end

  def soldiers_remaining
    soldiers.where("health > '0'")
  end

end
