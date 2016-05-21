require 'test_helper'

I18n.locale = :en
Mongoid.raise_not_found_error = false

class UserTest < ActiveSupport::TestCase
  test "create user 0" do
     member = Member.create(member_id: "delgado", name: "John Delgado", email: "10-10196@usb.ve", photo: "default.png")
     assert !(member.save)
  end

   test "create user 1" do
     existed = !(Member.where(member_id: "camomila").exists?)
     Member.create(member_id: "camomila", name: "camomila", email: "pe@gmail.com")
     created = Member.find_by(member_id: "camomila")
     Member.where(member_id: "camomila").delete
     deleted = !(Member.where(member_id: "camomila").exists?)
     assert existed && created && deleted
   end

   test "get user john" do
     assert Member.where(name: "John Delgado")
   end

   test "get user marcos" do
     assert Member.find_by(member_id: "campos")
   end

   test "get user poogle" do
     assert !Member.find_by(member_id: "poogle")
   end
end
