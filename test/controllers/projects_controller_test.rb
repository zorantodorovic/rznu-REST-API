require 'test_helper'
require 'json'

class ProjectsControllerTest < ActionController::TestCase

  test "Should get valid list of projects" do
    get :index
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal Project.count, jdata['data'].length
    assert_equal jdata['data'][0]['type'], 'projects'
  end
end