require 'test_helper'

class ArmyTest < ActiveSupport::TestCase
  def setup
    @army1 = armies(:one)
  end

  test 'shoud build the appropriate number of soldiers' do
    @army1.build_army!
    assert_equal 4, FootSoldier.where(army_id: @army1.id).count, 'Should be 4'
    assert_equal 2, Archer.where(army_id: @army1.id).count, 'Should be 2'
    assert_equal 3, Knight.where(army_id: @army1.id).count, 'Should be 3'
  end

  test "should find surviving soldiers in given army" do
    @army1.build_army!
    2.times do
      @army1.soldiers.sample.update_attributes(health: 0)
    end
    assert_equal 7, @army1.soldiers_remaining.count
  end
end
