require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should login" do
    ben = users(:one)
    post :create, name: ben.name, password: '123'
    assert_redirected_to admin_url
    assert_equal ben.id, session[:user_id]
  end 

  test "shoul fail login" do 
    ben = users(:one)
    post :create, name: ben.name, password: '1'
    assert_redirected_to login_url
  end 

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
  end  

end
