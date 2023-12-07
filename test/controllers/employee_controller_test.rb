require "test_helper"

class EmployeeControllerTest < ActionDispatch::IntegrationTest
  test "should get store" do
    get employee_store_url
    assert_response :success
  end

  test "should get tax_deductions" do
    get employee_tax_deductions_url
    assert_response :success
  end
end
