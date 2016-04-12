require 'test_helper'

class BattlesControllerTest < ActionController::TestCase

  def setup
    @A1 = Army.create(id: 2, name: "army1", infantry: 20, archers: 20, knights: 20)
    @A2 = Army.create(id: 3, name: "army2", infantry: 20, archers: 20, knights: 20)
  end 

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'battles/new'
  end

  test "should create a new battle object" do
    get :new
    battle = assigns(:battle) 
    assert battle.new_record?
    assert_response :success
  end

  test "should create a battle that persists and redirects to show" do
    params = {
      battle: {army_a: @A1.id, army_b: @A2.id}
    }
    post :create, params
    battle = assigns(:battle)
    assert battle.persisted?
    assert_redirected_to battle
  end
end
