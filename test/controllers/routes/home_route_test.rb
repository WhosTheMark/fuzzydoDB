require 'test_helper'

class HomeRoutesTest < ActionController::TestCase

  test "should route to home in Spanish" do
    assert_routing '/', { controller: "home", action: "index"}
  end

  test "should route to home in Spanish with locale" do
    assert_routing '/es', { controller: "home", action: "index", locale: "es"}
  end

  test "should route to home in English" do
    assert_routing '/en', { controller: "home", action: "index", locale: "en"}
  end

end