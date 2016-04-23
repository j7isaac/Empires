require 'test_helper'

class ArmiesControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
    assert_template 'armies/new'
  end

  test 'should create a new battle object' do
    get :new
    army = assigns(:army)
    assert army.new_record?
    assert_response :success
  end

  test 'should create a battle that persists and redirects to new' do
    params = {
      army: {
        name: 'test_army',
        infantry: 30,
        archers: 60,
        knights: 120
      }
    }
    post :create, params
    army = assigns(:army)
    assert army.persisted?
    assert_redirected_to new_army_path
  end
end
