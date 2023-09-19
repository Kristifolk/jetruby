require "application_system_test_case"

class LabreportsTest < ApplicationSystemTestCase
  setup do
    @labreport = labreports(:one)
  end

  test "visiting the index" do
    visit labreports_url
    assert_selector "h1", text: "Labreports"
  end

  test "should create labreport" do
    visit labreports_url
    click_on "New labreport"

    fill_in "Description", with: @labreport.description
    fill_in "File name", with: @labreport.file_name
    fill_in "Grade", with: @labreport.grade
    fill_in "Number report", with: @labreport.number_report
    fill_in "Title", with: @labreport.title
    fill_in "User", with: @labreport.user_id
    click_on "Create Labreport"

    assert_text "Labreport was successfully created"
    click_on "Back"
  end

  test "should update Labreport" do
    visit labreport_url(@labreport)
    click_on "Edit this labreport", match: :first

    fill_in "Description", with: @labreport.description
    fill_in "File name", with: @labreport.file_name
    fill_in "Grade", with: @labreport.grade
    fill_in "Number report", with: @labreport.number_report
    fill_in "Title", with: @labreport.title
    fill_in "User", with: @labreport.user_id
    click_on "Update Labreport"

    assert_text "Labreport was successfully updated"
    click_on "Back"
  end

  test "should destroy Labreport" do
    visit labreport_url(@labreport)
    click_on "Destroy this labreport", match: :first

    assert_text "Labreport was successfully destroyed"
  end
end
