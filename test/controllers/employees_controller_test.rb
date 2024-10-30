require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get employees_show_url
    assert_response :success
  end

  test "should get edit" do
    get employees_edit_url
    assert_response :success
  end
end
