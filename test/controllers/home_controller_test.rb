require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get home_top_url
    assert_response :success
  end

  test "should get company_top" do
    get home_company_top_url
    assert_response :success
  end

  test "should get employee_top" do
    get home_employee_top_url
    assert_response :success
  end
end
