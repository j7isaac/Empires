require 'test_helper'

class ArmyTest < ActiveSupport::TestCase
  def setup
    @army1 = armies(:one)
  end

  test 'shoud build the appropriate number of soldiers' do
    @army1.build_army!
    assert_equal 1, FootSoldier.count, 'Should be 1'
    assert_equal 2, Archer.count, 'Should be 2'
    assert_equal 3, Knight.count, 'Should be 3'
  end
    
      
    
    

end
