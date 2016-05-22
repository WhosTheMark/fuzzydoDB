require 'test_helper'

I18n.locale = :en
Mongoid.raise_not_found_error = false

class UserTest < ActiveSupport::TestCase
  test "create user without username" do
    user = User.create(username: "", name: "Raid", email: "raid@usb.ve", password: "12313223sasdfawsdaw")
    assert !(user.save)
  end

  test "create user without name" do
    user = User.create(username: "raid", name: "", email: "raid@usb.ve", password: "12313223sasdfawsdaw")
    assert !(user.save)
  end

  test "create user without email" do
    user = User.create(username: "raid", name: "Raid", email: "", password: "12313223sasdfawsdaw")
    assert !(user.save)
  end

  test "email exists" do
    User.create(username: "johndelgado", name: "John Delgado", email: "1010196@usb.ve", password: "12313223sasdfawsdaw").save
    exists = User.exists_email? "1010196@usb.ve"
    User.where(username: "johndelgado").delete
    assert exists
  end

  test "email does not exists" do
    exists = User.exists_username? "10-10196@usb.ve"
    assert !(exists)
  end

  test "username exists" do
    User.create(username: "johndelgado", name: "John Delgado", email: "1010196@usb.ve", password: "12313223sasdfawsdaw").save
    exists = User.exists_username? "johndelgado"
    User.where(username: "johndelgado").delete
    assert exists
  end

  test "username does not exists" do
    exists = User.exists_email? "1010196"
    assert !(exists)
  end

  test "create duplicate user" do
    User.create(username: "delgado", name: "John Delgado", email: "10-10196@usb.ve", password: "12313223sasdfawsdaw").save
    saved = User.create(username: "delgado", name: "John Delgado", email: "10-10196@usb.ve", password: "12313223sasdfawsdaw").save
    User.where(username: "delgado").delete
    assert !(saved)
  end

  test "get user that exists" do
    User.create(username: "delgado", name: "John Delgado", email: "10-10196@usb.ve").save
    found = User.where(name: "John Delgado")
    User.where(username: "delgado").delete
    assert found
  end

  test "get user that doesnt exist" do
    assert !User.find_by(username: "whosthemark")
  end
end
