require 'test_helper'

class UserRoutesTest < ActionController::TestCase

  test "should route to admin view in Spanish" do
    assert_routing '/admin/users', { controller: "users",
      action: "index"}
  end

  test "should route to admin view in Spanish with locale" do
    assert_routing '/es/admin/users', { controller: "users",
      action: "index", locale: "es"}
  end

  test "should route to admin view in English" do
    assert_routing '/en/admin/users', { controller: "users",
      action: "index", locale: "en"}
  end

  test "should route to show profile in Spanish" do
    assert_routing '/profile/username1', { controller: "users",
      action: "show", username: "username1"}
  end

  test "should route to show profile in Spanish with locale" do
    assert_routing '/es/profile/username1', { controller: "users",
      action: "show", username: "username1", locale: "es"}
  end

  test "should route to show profile in English" do
    assert_routing '/en/profile/username1', { controller: "users",
      action: "show", username: "username1", locale: "en"}
  end

  test "should route to edit profile in Spanish" do
    assert_routing '/profile/username1/edit', { controller: "users",
      action: "edit", username: "username1"}
  end

  test "should route to edit profile in Spanish with locale" do
    assert_routing '/es/profile/username1/edit', { controller: "users",
      action: "edit", username: "username1", locale: "es"}
  end

  test "should route to edit profile in English" do
    assert_routing '/en/profile/username1/edit', { controller: "users",
      action: "edit", username: "username1", locale: "en"}
  end

  test "should route to edit profile picture in Spanish" do
    assert_routing '/profile/username1/editPhoto', { controller: "users",
      action: "edit_profile_photo", username: "username1"}
  end

  test "should route to edit profile picture in Spanish with locale" do
    assert_routing '/es/profile/username1/editPhoto', { controller: "users",
      action: "edit_profile_photo", username: "username1", locale: "es"}
  end

  test "should route to edit profile picture in English" do
    assert_routing '/en/profile/username1/editPhoto', { controller: "users",
      action: "edit_profile_photo", username: "username1", locale: "en"}
  end

  test "should route to update profile in Spanish" do
    assert_routing({ method: 'put', path: '/profile/id1' },
      { controller: "users", action: "update", id: "id1"})
  end

  test "should route to update profile in Spanish with locale" do
    assert_routing({ method: 'put', path: '/es/profile/id1' },
      { controller: "users", action: "update", id: "id1", locale: "es"})
  end

  test "should route to update profile in English" do
    assert_routing({ method: 'put', path: '/en/profile/id1' },
      { controller: "users", action: "update", id: "id1", locale: "en"})
  end

  test "should route to update profile photo in Spanish" do
    assert_routing({ method: 'put', path: '/profile/update_avatar' },
      { controller: "users", action: "update_avatar"})
  end

  test "should route to update profile photo in Spanish with locale" do
    assert_routing({ method: 'put', path: '/es/profile/update_avatar' },
      { controller: "users", action: "update_avatar", locale: "es"})
  end

  test "should route to update profile photo in English" do
    assert_routing({ method: 'put', path: '/en/profile/update_avatar' },
      { controller: "users", action: "update_avatar", locale: "en"})
  end

  test "should route to destroy user in Spanish" do
    assert_routing({ method: 'delete', path: 'admin/users/id1' },
      { controller: "users", action: "destroy", id: "id1"})
  end

  test "should route to destroy user in Spanish with locale" do
    assert_routing({ method: 'delete', path: '/es/admin/users/id1' },
      { controller: "users", action: "destroy", id: "id1", locale: "es"})
  end

  test "should route to destroy user in English" do
    assert_routing({ method: 'delete', path: '/en/admin/users/id1' },
      { controller: "users", action: "destroy", id: "id1", locale: "en"})
  end

  test "should route to destroy avatar in Spanish" do
    assert_routing({ method: 'delete', path: 'profile/destroy_avatar' },
      { controller: "users", action: "destroy_avatar"})
  end

  test "should route to destroy avatar in Spanish with locale" do
    assert_routing({ method: 'delete', path: '/es/profile/destroy_avatar' },
      { controller: "users", action: "destroy_avatar", locale: "es"})
  end

  test "should route to destroy avatar in English" do
    assert_routing({ method: 'delete', path: '/en/profile/destroy_avatar' },
      { controller: "users", action: "destroy_avatar", locale: "en"})
  end

  test "should route to validate username in Spanish" do
    assert_routing({ method: 'post', path: 'users/validateUsername' },
      { controller: "users", action: "validate_username", format: "json"})
  end

  test "should route to validate username in Spanish with locale" do
    assert_routing({ method: 'post', path: '/es/users/validateUsername' },
      { controller: "users", action: "validate_username", format: "json", locale: "es"})
  end

  test "should route to validate username in English" do
    assert_routing({ method: 'post', path: '/en/users/validateUsername' },
      { controller: "users", action: "validate_username", format: "json", locale: "en"})
  end

  test "should route to validate email in Spanish" do
    assert_routing({ method: 'post', path: 'users/validateEmail' },
      { controller: "users", action: "validate_email", format: "json"})
  end

  test "should route to validate email in Spanish with locale" do
    assert_routing({ method: 'post', path: '/es/users/validateEmail' },
      { controller: "users", action: "validate_email", format: "json", locale: "es"})
  end

  test "should route to validate email in English" do
    assert_routing({ method: 'post', path: '/en/users/validateEmail' },
      { controller: "users", action: "validate_email", format: "json", locale: "en"})
  end

  test "should route to change roles in Spanish" do
    assert_routing({ method: 'put', path: '/admin/users/changeRoles' },
      { controller: "users", action: "change_roles"})
  end

  test "should route to change roles in Spanish with locale" do
    assert_routing({ method: 'put', path: '/es/admin/users/changeRoles' },
      { controller: "users", action: "change_roles", locale: "es"})
  end

  test "should route to change roles in English" do
    assert_routing({ method: 'put', path: '/en/admin/users/changeRoles' },
      { controller: "users", action: "change_roles", locale: "en"})
  end

  test "should route to show transfer role in Spanish" do
    assert_routing '/admin/transferRole' ,
      { controller: "users", action: "show_transfer_role"}
  end

  test "should route to show transfer roles in Spanish with locale" do
    assert_routing '/es/admin/transferRole' ,
      { controller: "users", action: "show_transfer_role", locale: "es"}
  end

  test "should route to show transfer roles in English" do
    assert_routing '/en/admin/transferRole' ,
      { controller: "users", action: "show_transfer_role", locale: "en"}
  end

  test "should route to transfer roles in Spanish" do
    assert_routing({ method: 'post', path: '/admin/transferRole' },
      { controller: "users", action: "transfer_role"})
  end

  test "should route to transfer roles in Spanish with locale" do
    assert_routing({ method: 'post', path: '/es/admin/transferRole' },
      { controller: "users", action: "transfer_role", locale: "es"})
  end

  test "should route to transfer roles in English" do
    assert_routing({ method: 'post', path: '/en/admin/transferRole' },
      { controller: "users", action: "transfer_role", locale: "en"})
  end

end