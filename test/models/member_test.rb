require 'test_helper'

I18n.locale = :en
Mongoid.raise_not_found_error = false

class MemberTest < ActiveSupport::TestCase
  test "create member without member_id" do
     member = Member.create(member_id: "", name: "Raid", email: "raid@usb.ve", photo: "default.png")
     assert !(member.save)
  end

  test "create member without name" do
     member = Member.create(member_id: "raid", name: "", email: "raid@usb.ve", photo: "default.png")
     assert !(member.save)
  end

  test "create member without email" do
     member = Member.create(member_id: "raid", name: "Raid", email: "", photo: "default.png")
     assert !(member.save)
  end

  test "create member without photo" do
     member = Member.create(member_id: "raid", name: "Raid", email: "raid@usb.ve", photo: "")
     created = member.save
     Member.where(member_id: "raid").delete
     deleted = !Member.where(member_id: "raid").exists?
     assert created && deleted
  end

  test "create member 1" do
     member = Member.create(member_id: "delgado", name: "John Delgado", email: "10-10196@usb.ve", photo: "default.png")
     assert !(member.save)
  end

   test "create member 2" do
     existed = !(Member.where(member_id: "camomila").exists?)
     Member.create(member_id: "camomila", name: "camomila", email: "pe@gmail.com")
     created = Member.find_by(member_id: "camomila").save
     Member.where(member_id: "camomila").delete
     deleted = !(Member.where(member_id: "camomila").exists?)
     assert existed && created && deleted
   end

   test "get member john" do
     assert Member.where(name: "John Delgado")
   end

   test "get member marcos" do
     assert Member.find_by(member_id: "campos")
   end

   test "get member poogle" do
     assert !Member.find_by(member_id: "poogle")
   end

   test "delete member poogle" do
     assert 0.0 == Member.where(member_id: "poogle").delete
   end
end

