class Army < ActiveRecord::Base
  has_many :soldiers
  belongs_to :battle
  after_create :build_army!

  def archers_remaining
    soldiers_remaining.where(type: "Archer").count
  end

  def knights_remaining
    soldiers_remaining.where(type: "Knight").count
  end

  def infantry_remaining
    soldiers_remaining.where(type: "FootSoldier").count
  end

  def army_attack(target)
    return if soldiers_remaining.nil? or target.nil?
    soldiers_remaining.sample.attack(target)
  end

  def damage_percentage
    health_data = []
    soldiers_remaining.each {|soldier| health_data << soldier.health}
    health_total = health_data.inject(0){|sum,x| sum + x }
    damage = (soldiers.count * 100) - health_total 
    ((p damage.to_f / (soldiers.count * 100)) * 100.0).to_i
  end

  def details
    "#{name} army remained with:"
    "#{infantry} Infantry Units"
    "#{archers} Archers"
    "#{knights} Knights"
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

  def percent(a, b)
  end

  def soldier_count
    soldiers_remaining.count
  end

  def soldiers_remaining
    soldiers.where("health > '0'")
  end

end
