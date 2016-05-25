require 'test_helper'

I18n.locale = :en

class MemberTest < ActiveSupport::TestCase

  def setup
    Member.delete_all
    @member1 = new_member("raid", "Raid", "raid@usb.ve", "")
    @developer1 = new_developer("delgadoD1", "John Delgado", "1010196@usb.ve", "")
  end

  def new_member(member_id, name, email, photo)
    Member.new(member_id: member_id, name: name, email: email, photo: photo)
  end

  def new_developer(member_id, name, email, photo)
    Developer.new(member_id: member_id, name: name, email: email, photo: photo)
  end

  ### Validations ###

  test "create member without member_id" do
    assert_raises Mongoid::Errors::Validations do
      new_member("", "Raid", "raid@usb.ve", "default.png").save!
    end
  end

  test "create member without name" do
    assert_raises Mongoid::Errors::Validations do
      new_member("raid", "", "raid@usb.ve", "default.png").save!
    end
  end

  test "create member without email" do
    assert_raises Mongoid::Errors::Validations do
      new_member("raid", "Raid", "", "default.png").save!
    end
  end

  test "create duplicate member" do
    @member1.save!
    assert_raises Mongoid::Errors::Validations do
      new_member(@member1.member_id, @member1.name, @member1.email, @member1.photo).save!
    end
  end

  ### Member functions ###

  test "get user that exists" do
    @member1.save!
    stored_memeber = Member.get_by_id @member1.member_id
    assert_equal stored_memeber.member_id, @member1.member_id,
      "The ids are not the same"
  end

  test "get user that doesn't exist" do
    assert_nil Member.get_by_id("delgado"), "get_by_id is returning a member"
  end

  test "get non developers 1 devop 1 member" do

    @developer1.save!
    @member1.save!
    members = Member.get_non_developers
    assert_equal members.first, @member1, "get_non_developers is not returning properly"
  end

  test "get non developers 1 devop 0 member" do

    @developer1.save!
    assert_equal Member.get_non_developers, [],
      "get_non_developers is returning a developer"
  end

end
