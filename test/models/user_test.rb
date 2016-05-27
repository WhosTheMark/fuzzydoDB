require 'test_helper'

I18n.locale = :en

class UserTest < ActiveSupport::TestCase

  def setup
    @user1 = new_user("johndelgado", "John Delgado", "1010196@usb.ve", "12313223sasdfawsdaw")
    User.delete_all
  end

  def new_user(username, name, email, password)
    User.new(username: username, name: name, email: email, password: password)
  end

  ### Validations ###
  test "create user with nil username" do
    assert_raises Mongoid::Errors::Validations do
      new_user(nil, "Raid", "raid@usb.ve", "12313223sasdfawsdaw").save!
    end
  end

  test "create user with nil name" do
    assert_raises Mongoid::Errors::Validations do
      new_user("raid", nil, "raid@usb.ve", "12313223sasdfawsdaw").save!
    end
  end

  test "create user with nil email" do
    assert_raises Mongoid::Errors::Validations do
      new_user("raid", "Raid", nil, "12313223sasdfawsdaw").save!
    end
  end

  test "create user with nil password" do
    assert_raises Mongoid::Errors::Validations do
      new_user("raid", "Raid", "raid@usb.ve", nil).save!
    end
  end

  test "create user with empty username" do
    assert_raises Mongoid::Errors::Validations do
      new_user("", "Raid", "raid@usb.ve", "12313223sasdfawsdaw").save!
    end
  end

  test "create user with empty name" do
    assert_raises Mongoid::Errors::Validations do
      new_user("raid", "", "raid@usb.ve", "12313223sasdfawsdaw").save!
    end
  end

  test "create user with empty email" do
    assert_raises Mongoid::Errors::Validations do
      new_user("raid", "Raid", "", "12313223sasdfawsdaw").save!
    end
  end

  test "create user with empty password" do
    assert_raises Mongoid::Errors::Validations do
      new_user("raid", "Raid", "raid@usb.ve", "").save!
    end
  end

  test "create user with bad formed email" do
    assert_raises Mongoid::Errors::Validations do
      new_user("raid", "Raid", "malformed", "12313223sasdfawsdaw").save!
    end
  end

  test "create duplicate user with spaces before the username field" do
    @user1.save!
    duplicate_user = new_user(" " + @user1.username, @user1.name, @user1.email, @user1.password)
    assert_raises Mongoid::Errors::Validations do
      duplicate_user.save!
    end
  end

  test "create duplicate user with spaces after the username field" do
    @user1.save!
    duplicate_user = new_user(@user1.username + " ", @user1.name, @user1.email, @user1.password)
    assert_raises Mongoid::Errors::Validations do
      duplicate_user.save!
    end
  end

  test "create duplicate user with spaces before the email field" do
    @user1.save!
    duplicate_user = new_user(@user1.username, @user1.name, " " + @user1.email, @user1.password)
    assert_raises Mongoid::Errors::Validations do
      duplicate_user.save!
    end
  end

  test "create duplicate user with spaces after the email field" do
    @user1.save!
    duplicate_user = new_user(@user1.username, @user1.name, @user1.email + " ", @user1.password)
    assert_raises Mongoid::Errors::Validations do
      duplicate_user.save!
    end
  end

  test "create duplicate user username" do
    @user1.save!
    duplicate_user = new_user(@user1.username, "Raid", "raid@raid.com", "12313223sasdfawsdaw")
    assert_raises Mongoid::Errors::Validations do
      duplicate_user.save!
    end
  end

  test "create duplicate user email" do
    @user1.save!
    duplicate_user = new_user("raid", "Raid", @user1.email, "12313223sasdfawsdaw")
    assert_raises Mongoid::Errors::Validations do
      duplicate_user.save!
    end
  end

  test "create duplicate user" do
    @user1.save!
    duplicate_user = new_user(@user1.username, @user1.name, @user1.email, @user1.password)
    assert_raises Mongoid::Errors::Validations do
      duplicate_user.save!
    end
  end

  test "well inserted user" do
    @user1.save!
    assert_not_nil User.find_by(:email => @user1.email), "User was not inserted"
  end
  ### User functions ###

  test "email exists" do
    @user1.save!
    assert((User.exists_email? @user1.email),
      "Function says email does not exist")
  end

  test "email does not exists" do
    assert_not((User.exists_email? "1010196"),
      "Function says email exists")
  end

  test "username exists" do
    @user1.save!
    assert((User.exists_username? @user1.username),
      "Function says username does not exist")
  end

  test "username does not exists" do
    assert_not((User.exists_username? "10-10196@usb.ve"),
      "Function says username exists")
  end

end
