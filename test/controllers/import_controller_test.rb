require 'test_helper'

class ImportControllerTest < ActionController::TestCase
  test "should get upload" do
    get :upload
    assert_response :success
  end

  test "should process uploaded file" do
    input_data = fixture_file_upload('files/example_input.tab','text/text')
    assert_difference('Purchase.count',4) do
      post :import, upload: {data_file: input_data}
    end

    assert_response :success
    assert_not_nil assigns(:total_revenue)
  end

end
