require 'test_helper'

class BallotInitiativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ballot_initiative = ballot_initiatives(:one)
  end

  test "should get index" do
    get ballot_initiatives_url
    assert_response :success
  end

  test "should get new" do
    get new_ballot_initiative_url
    assert_response :success
  end

  test "should create ballot_initiative" do
    assert_difference('BallotInitiative.count') do
      post ballot_initiatives_url, params: { ballot_initiative: { name: @ballot_initiative.name, team_id: @ballot_initiative.team_id } }
    end

    assert_redirected_to ballot_initiative_url(BallotInitiative.last)
  end

  test "should show ballot_initiative" do
    get ballot_initiative_url(@ballot_initiative)
    assert_response :success
  end

  test "should get edit" do
    get edit_ballot_initiative_url(@ballot_initiative)
    assert_response :success
  end

  test "should update ballot_initiative" do
    patch ballot_initiative_url(@ballot_initiative), params: { ballot_initiative: { name: @ballot_initiative.name, team_id: @ballot_initiative.team_id } }
    assert_redirected_to ballot_initiative_url(@ballot_initiative)
  end

  test "should destroy ballot_initiative" do
    assert_difference('BallotInitiative.count', -1) do
      delete ballot_initiative_url(@ballot_initiative)
    end

    assert_redirected_to ballot_initiatives_url
  end
end
