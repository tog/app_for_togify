require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_match
    assert_difference('Match.count') do
      post :create, :match => { }
    end

    assert_redirected_to match_path(assigns(:match))
  end

  def test_should_show_match
    get :show, :id => matches(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => matches(:one).id
    assert_response :success
  end

  def test_should_update_match
    put :update, :id => matches(:one).id, :match => { }
    assert_redirected_to match_path(assigns(:match))
  end

  def test_should_destroy_match
    assert_difference('Match.count', -1) do
      delete :destroy, :id => matches(:one).id
    end

    assert_redirected_to matches_path
  end
end
