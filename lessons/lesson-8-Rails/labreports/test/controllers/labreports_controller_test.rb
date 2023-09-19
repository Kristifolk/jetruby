require "test_helper"

class LabreportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labreport = labreports(:one)
  end

  test "should get index" do
    get labreports_url
    assert_response :success
  end

  test "should get new" do
    get new_labreport_url
    assert_response :success
  end

  test "should create labreport" do
    assert_difference("Labreport.count") do
      post labreports_url, params: { labreport: { description: @labreport.description, file_name: @labreport.file_name, grade: @labreport.grade, number_report: @labreport.number_report, title: @labreport.title, user_id: @labreport.user_id } }
    end

    assert_redirected_to labreport_url(Labreport.last)
  end

  test "should show labreport" do
    get labreport_url(@labreport)
    assert_response :success
  end

  test "should get edit" do
    get edit_labreport_url(@labreport)
    assert_response :success
  end

  test "should update labreport" do
    patch labreport_url(@labreport), params: { labreport: { description: @labreport.description, file_name: @labreport.file_name, grade: @labreport.grade, number_report: @labreport.number_report, title: @labreport.title, user_id: @labreport.user_id } }
    assert_redirected_to labreport_url(@labreport)
  end

  test "should destroy labreport" do
    assert_difference("Labreport.count", -1) do
      delete labreport_url(@labreport)
    end

    assert_redirected_to labreports_url
  end
end
