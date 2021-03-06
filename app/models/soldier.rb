class Soldier < ActiveRecord::Base
  belongs_to :army
  def attack(target)
    enemy = target.sample
    result = attack_damage - (enemy.defense + enemy.lucky_number) + lucky_number
    deal_damage(enemy, result) if result > 0
  end

  def deal_damage(target, value)
    new_value = target.health - value
    target.update_attribute :health, new_value
  end

  def lucky_number
    (1..luck).to_a.sample
  end
end
