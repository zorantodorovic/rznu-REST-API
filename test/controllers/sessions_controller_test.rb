require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
	
  test "should login" do
  	@request.headers["Content-Type"] = 'application/vnd.api+json'
  	post :create_session, params: {"username":"mislav.grgic@fer.hr", "password":"password"}
   	assert_response 200
  end

  test "should route to delete session" do
    assert_routing({ method: 'delete', path: '/sessions/something'},
                   { controller: "sessions", action: "destroy", id: "something" })
  end
end
