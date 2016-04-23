require 'test_helper'

class ArmyTest < ActiveSupport::TestCase
  def setup
    @army1 = armies(:one)
    @army2 = armies(:two)
    @army1.build_army!
    @army2.build_army!
  end

  test 'shoud build the appropriate number of soldiers' do
    assert_equal 4, FootSoldier.where(army_id: @army1.id).count, 'Should be 4'
    assert_equal 2, Archer.where(army_id: @army1.id).count, 'Should be 2'
    assert_equal 3, Knight.where(army_id: @army1.id).count, 'Should be 3'
  end

  test 'should find surviving soldiers in given army' do
    2.times { @army1.soldiers.sample.update_attributes(health: 0) }
    assert_equal 7, @army1.soldiers_remaining.count
  end

  test 'should determine the total health amount of given army' do
    assert_equal 900, @army1.health_total, 'Should be 900'
  end

  test 'should verify the correct percentage' do
    assert_equal '37.53%', @army1.fraction_to_percent(3.753, 10)
    assert_equal '78.93%', @army1.fraction_to_percent(7.893, 10)
    assert_equal '12.89%', @army1.fraction_to_percent(1.289, 10)
  end

  test 'should verify the correct damage percentage sustained' do
    Knight.where(army_id: @army1.id).each { |s| s.update_attributes(health: 0) }
    Knight.where(army_id: @army2.id).each { |s| s.update_attributes(health: 0) }
    assert_equal '33.33%', @army1.damage_percentage
    assert_equal '41.67%', @army2.damage_percentage
  end
end
