require 'test_helper'

class RegistrationRoutesTest < ActionController::TestCase


  test "should route to create user in Spanish" do
    assert_routing({ method: 'post', path: '/users' },
      { controller: "registrations", action: "create"})
  end

  test "should route to create user in Spanish with locale" do
    assert_routing({ method: 'post', path: '/es/users' },
      { controller: "registrations", action: "create", locale: "es"})
  end

  test "should route to create user in English" do
    assert_routing({ method: 'post', path: '/en/users' },
      { controller: "registrations", action: "create", locale: "en"})
  end

end