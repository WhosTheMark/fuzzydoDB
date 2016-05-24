require 'test_helper'

class AboutRoutesTest < ActionController::TestCase

  test "should route to about us in Spanish" do
    assert_routing '/about', { controller: "about",
      action: "index"}
  end

  test "should route to about us in Spanish with locale" do
    assert_routing '/es/about', { controller: "about",
      action: "index", locale: "es"}
  end

  test "should route to about us in English" do
    assert_routing '/en/about', { controller: "about",
      action: "index", locale: "en"}
  end

  test "should route to history in Spanish" do
    assert_routing '/about/history', { controller: "about",
      action: "history"}
  end

  test "should route to history in Spanish with locale" do
    assert_routing '/es/about/history', { controller: "about",
      action: "history", locale: "es"}
  end

  test "should route to history in English" do
    assert_routing '/en/about/history', { controller: "about",
      action: "history", locale: "en"}
  end

  test "should route to members in Spanish" do
    assert_routing '/about/members', { controller: "about",
      action: "members"}
  end

  test "should route to members in Spanish with locale" do
    assert_routing '/es/about/members', { controller: "about",
      action: "members", locale: "es"}
  end

  test "should route to members in English" do
    assert_routing '/en/about/members', { controller: "about",
      action: "members", locale: "en"}
  end

  test "should route to a member in Spanish" do
    assert_routing '/about/member/carrasquel', { controller: "about",
      action: "member", id: "carrasquel"}
  end

  test "should route to a member in Spanish with locale" do
    assert_routing '/es/about/member/carrasquel', { controller: "about",
      action: "member", locale: "es", id: "carrasquel"}
  end

  test "should route to a member in English" do
    assert_routing '/en/about/member/carrasquel', { controller: "about",
      action: "member", locale: "en", id: "carrasquel"}
  end

end