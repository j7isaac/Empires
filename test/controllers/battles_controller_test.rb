require 'test_helper'

class BattlesControllerTest < ActionController::TestCase
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
      battle: {army_a: "test_army", army_b: "test_army_2"}
    }
    post :create, params
    battle = assigns(:battle)
    assert battle.persisted?
    assert_redirected_to battle
  end
end
