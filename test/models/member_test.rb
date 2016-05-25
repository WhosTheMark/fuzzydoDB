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

  test "create member with nil member_id" do
    assert_raises Mongoid::Errors::Validations do
      new_member(nil, "Raid", "raid@usb.ve", "default.png").save!
    end
  end

  test "create member with nil name" do
    assert_raises Mongoid::Errors::Validations do
      new_member("raid", nil, "raid@usb.ve", "default.png").save!
    end
  end

  test "create member with nil email" do
    assert_raises Mongoid::Errors::Validations do
      new_member("raid", "Raid", nil, "default.png").save!
    end
  end

  test "create member with empty member_id" do
    assert_raises Mongoid::Errors::Validations do
      new_member("", "Raid", "raid@usb.ve", "default.png").save!
    end
  end

  test "create member with empty name" do
    assert_raises Mongoid::Errors::Validations do
      new_member("raid", "", "raid@usb.ve", "default.png").save!
    end
  end

  test "create member with empty email" do
    assert_raises Mongoid::Errors::Validations do
      new_member("raid", "Raid", "", "default.png").save!
    end
  end

  test "create member with bad formed email" do
    assert_raises Mongoid::Errors::Validations do
      new_member("raid", "Raid", "malformed", "default.png").save!
    end
  end

  test "create duplicate member with spaces before the member_id field" do
    @member1.save!
    duplicate_member = new_member(" " + @member1.member_id, "Raid", "raid2@raid.com", "12313223sasdfawsdaw")
    assert_raises Mongoid::Errors::Validations do
      duplicate_member.save!
    end
  end

  test "create duplicate member with spaces after the member_id field" do
    @member1.save!
    duplicate_member = new_member(@member1.member_id + " ", "Raid", "raid2@raid.com", "12313223sasdfawsdaw")
    assert_raises Mongoid::Errors::Validations do
      duplicate_member.save!
    end
  end

  test "create duplicate member with spaces before the email field" do
    @member1.save!
    duplicate_member = new_member("raidsr", "Raid", " " + @member1.email, "12313223sasdfawsdaw")
    assert_raises Mongoid::Errors::Validations do
      duplicate_member.save!
    end
  end

  test "create duplicate member with spaces after the email field" do
    @member1.save!
    duplicate_member = new_member("raidsr", "Raid", @member1.email + " ", "12313223sasdfawsdaw")
    assert_raises Mongoid::Errors::Validations do
      duplicate_member.save!
    end
  end

  test "create duplicate member id" do
    @member1.save!
    duplicate_member = new_member(@member1.member_id, "Raid", "raid2@raid.com", "12313223sasdfawsdaw")
    assert_raises Mongoid::Errors::Validations do
      duplicate_member.save!
    end
  end

  test "create duplicate user email" do
    @member1.save!
    duplicate_member = new_member("raidosr", "Raid", @member1.email, "12313223sasdfawsdaw")
    assert_raises Mongoid::Errors::Validations do
      duplicate_member.save!
    end
  end

  test "create duplicate member" do
    @member1.save!
    assert_raises Mongoid::Errors::Validations do
      new_member(@member1.member_id, @member1.name, @member1.email, @member1.photo).save!
    end
  end

  test "create member and duplicate member_id for developer" do
    @member1.save!
    assert_raises Mongoid::Errors::Validations do
      new_developer(@member1.member_id, "Raid", "raid@raid.com", "default.png").save!
    end
  end

  test "create member and duplicate email for developer" do
    @member1.save!
    assert_raises Mongoid::Errors::Validations do
      new_developer("raid", "Raid", @member1.email, "default.png").save!
    end
  end

  test "well inserted member" do
    @member1.save!
    assert_not_nil Member.find_by(:email => @member1.email )
  end

  test "well inserted developer" do
    @developer1.save!
    assert_not_nil Developer.find_by(:email => @developer1.email )
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

  test "get non developers 0 devop 0 member" do
    assert_equal Member.get_non_developers, [], "get_non_developers is not returning properly: 0 devop 0 member"
  end

  test "get non developers 0 devop 1 member" do
    @member1.save!
    members = Member.get_non_developers
    assert_equal members.first, @member1, "get_non_developers is not returning properly: 0 devop 1 member"
  end

  test "get non developers 1 devop 1 member" do
    @developer1.save!
    @member1.save!
    members = Member.get_non_developers
    assert_equal members.first, @member1, "get_non_developers is not returning properly: 1 devop 1 member"
  end

  test "get non developers 1 devop 0 member" do
    @developer1.save!
    assert_equal Member.get_non_developers, [],
      "get_non_developers is returning a developer"
  end

end
