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
    created = Member.create(member_id: "raid123456", name: "Raid", email: "raid123456@usb.ve", photo: "").save
    Member.where(member_id: "raid123456").delete
    assert created
  end

  test "create duplicate user" do
    Member.create(member_id: "raid", name: "Raid", email: "raid@usb.ve", photo: "").save
    saved = Member.create(member_id: "raid", name: "Raid", email: "raid@usb.ve", photo: "").save
    User.where(member_id: "raid").delete
    assert !(saved)
  end

  test "get user that exists" do
    Member.create(member_id: "delgado", name: "John Delgado", email: "10-10196@usb.ve").save
    member = Member.get_by_id "delgado"
    Member.where(member_id: "delgado").delete
    assert member
  end

  test "get user that doesnt exist" do
    assert !Member.get_by_id("delgado")
  end

  test "get non developers 1 devop 1 member" do
    Developer.create(member_id: "delgadoD1", name: "John Delgado", email: "10-10196@usb.ve").save
    Member.create(member_id: "delgado1", name: "John Delgado", email: "1010196@usb.ve").save
    members = Member.get_non_developers
    added = members.first[:member_id].eql? "delgado1"
    Member.where(member_id: "delgado1").delete
    Developer.where(member_id: "delgadoD1").delete
    assert added
  end

  test "get non developers 1 devop 0 member" do
    Developer.create(member_id: "delgadoD", name: "John Delgado", email: "10-10196@usb.ve").save
    Developer.where(member_id: "delgadoD").delete
    assert Member.get_non_developers.first.nil?
  end
end
