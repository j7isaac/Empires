require 'test_helper'

class ArmyTest < ActiveSupport::TestCase
  def setup
    @army1 = armies(:one)
    @army2 = armies(:two)
  end

  test 'shoud build the appropriate number of soldiers' do
    @army1.build_army!
    assert_equal 1, FootSoldier.count, 'Should be 1'
    assert_equal 2, Archer.count, 'Should be 2'
    assert_equal 3, Knight.count, 'Should be 3'
  end

  test "should find surviving soldiers in given army" do
    @army1.build_army!
    @army2.build_army!
    5.times do
      Archer.create(
        army_id:@army1.id,
        cost:          60,
        health:         0,
        attack_damage: 12,
        defense:       15,
        luck:          22
      )
    end
    assert_equal 6, @army1.soldiers_remaining.count
  end
    
      
    
    

end
