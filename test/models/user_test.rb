require 'test_helper'

I18n.locale = :en
Mongoid.raise_not_found_error = false

class UserTest < ActiveSupport::TestCase
  test "create user without username" do
     user = User.create(username: "", name: "Raid", email: "raid@usb.ve")
     assert !(user.save)
  end

  test "create user without name" do
     user = User.create(username: "raid", name: "", email: "raid@usb.ve")
     assert !(user.save)
  end

  test "create user without email" do
     user = User.create(username: "raid", name: "Raid", email: "")
     assert !(user.save)
  end

  test "create user 1" do
     user = User.create(username: "delgado", name: "John Delgado", email: "10-10196@usb.ve")
     assert !(user.save)
  end

   test "create user 2" do
     existed = !(User.where(username: "camomila").exists?)
     User.create(username: "camomila", name: "camomila", email: "pe@gmail.com", password: "12313223sasdfawsdaw")
     created = User.find_by(username: "camomila").save
     User.where(username: "camomila").delete
     deleted = !(User.where(username: "camomila").exists?)
     assert existed && created && deleted
   end

   test "get user john" do
     assert User.where(name: "John Delgado")
   end

   test "get user marcos" do
     assert User.find_by(username: "whosthemark")
   end

   test "get user poogle" do
     assert !User.find_by(username: "poogle")
   end

   test "delete user poogle" do
     assert 0.0 == User.where(username: "poogle").delete
   end
end
