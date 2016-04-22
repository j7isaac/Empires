class Army < ActiveRecord::Base
  has_many :soldiers
  belongs_to :battle
  after_create :build_army!

  def build_army!
    infantry.times do
      create_infantry
    end
    archers.times do
      create_archer
    end
    knights.times do
      create_knight
    end
  end

  def archers_remaining
    soldiers_remaining.where(type: 'Archer').count
  end

  def knights_remaining
    soldiers_remaining.where(type: 'Knight').count
  end

  def infantry_remaining
    soldiers_remaining.where(type: 'FootSoldier').count
  end

  def attack(target)
    unless soldiers_remaining.empty? || target.empty?
      soldiers_remaining.sample.attack(target)
    end
  end

  def damage_percentage
    damage = soldiers.count * 100 - health_total
    to_percent(damage, (soldiers.count * 100))
  end

  def health_total
    soldiers_remaining.map(&:health).inject(0) { |a, e| a + e }
  end

  def to_percent(a, b)
    (a.to_f / b.to_f * 100).to_s + '%'
  end

  def create_infantry
    FootSoldier.create(
      army_id:        id,
      cost:           15,
      health:        100,
      attack_damage:  75,
      defense:        40,
      luck:           15
    )
  end

  def create_archer
    Archer.create(
      army_id:        id,
      cost:           60,
      health:        100,
      attack_damage:  40,
      defense:        20,
      luck:           50
    )
  end

  def create_knight
    Knight.create(
      army_id:        id,
      cost:          250,
      health:        100,
      attack_damage: 100,
      defense:        60,
      luck:           40
    )
  end

  def reset_health
    soldiers.each { |soldier| soldier.update_attributes(health: 100) }
  end

  def soldier_count
    soldiers_remaining.count
  end

  def soldiers_remaining
    soldiers.where("health > '0'")
  end
end
