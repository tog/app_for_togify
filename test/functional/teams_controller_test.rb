require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_team
    assert_difference('Team.count') do
      post :create, :team => { }
    end

    assert_redirected_to team_path(assigns(:team))
  end

  def test_should_show_team
    get :show, :id => teams(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => teams(:one).id
    assert_response :success
  end

  def test_should_update_team
    put :update, :id => teams(:one).id, :team => { }
    assert_redirected_to team_path(assigns(:team))
  end

  def test_should_destroy_team
    assert_difference('Team.count', -1) do
      delete :destroy, :id => teams(:one).id
    end

    assert_redirected_to teams_path
  end
end
