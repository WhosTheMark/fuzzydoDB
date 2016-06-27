require 'test_helper'

class UserManagementTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.current_driver = :selenium
    @super = User.new(name: "The Mighty Super Member",
               username: "super",
               email: "super@fuzzydo.db",
               password: "123123",
               password_confirmation: "123123",
               role: :super_member)
    @super.save!

    @user = User.new(name: "The not so powerful user",
               username: "user",
               email: "user@fuzzydo.db",
               password: "123123",
               password_confirmation: "123123",
               role: :user)

    @member = User.new(name: "The member of the team",
               username: "member",
               email: "member@fuzzydo.db",
               password: "123123",
               password_confirmation: "123123",
               role: :member)

    @admin = User.new(name: "The great admin of fuzzydo",
               username: "admin",
               email: "admin@fuzzydo.db",
               password: "123123",
               password_confirmation: "123123",
               role: :admin)

    @member_role = "Miembro"
    @user_role = "Usuario"
    @adminn_role = "Administrador"
    @super_role = "Supermiembro"
  end

  def teardown
    super
    User.delete_all
  end

  def add_other_users
    @user.save!
    @member.save!
    @admin.save!
  end

  def click_on_user_mgnt
    click_on('user-management-btn')
  end

  def login
    click_on('login-btn')
    sleep(2)
    fill_in('user_email', :with => @super.email)
    fill_in('user_password', :with => @super.password)
    click_on('send-login-btn')
  end

  def find_users
    all('tbody tr')
  end

  def delete_user_cell(user)
    user.all('td')[4]
  end

  def role_dropdown_cell(user)
    user.all('td')[5]
  end

  def get_dropdown_role(user)
    user.first('td button span').text
  end

  def get_user_by_role(users, role)

    res_user = nil

    users.each do |user|

      roleDropdownText = get_dropdown_role(user)

      if roleDropdownText.eql?(role)
        res_user = user
        break
      end
    end

    res_user
  end

  def visit_user_management
    visit("/")
    login
    click_on_user_mgnt
    sleep 2
  end

  test "user-management-btn active" do
    visit("/")
    login
    assert page.has_selector?('#user-management-btn'), 'User Management Btn is not active'
  end

  test "user management disabled widgets" do
    
    add_other_users

    visit_user_management
    users = find_users
    
    users.each do |user|

      roleDropdownText = get_dropdown_role(user)

      if roleDropdownText.eql?(@adminn_role) || roleDropdownText.eql?(@super_role)
        assert user.has_selector?('button.disabled')
        assert delete_user_cell(user).has_selector?('.disabled')
      else
        assert user.has_selector?('button:not(.disabled)')
        assert_not delete_user_cell(user).has_selector?('.disabled')
      end
    end
  end

  test "delete user" do

    add_other_users

    visit_user_management
    users = find_users
    user = get_user_by_role(users, @user_role)

    delete_user_cell(user).find('div a').click
    click_on("deleteBtn")
    sleep 2

    new_users = find_users

    assert_nil get_user_by_role(new_users, @user_role)
  end

  test "change role user to member" do

    add_other_users

    visit_user_management
    users = find_users
    user = get_user_by_role(users, @user_role)

    role_dropdown_cell(user).select(@member_role)
    find('#save-changes-btn').click

    sleep 2
    new_users = find_users

    assert_nil get_user_by_role(new_users, @user_role)
  end

  test "change role member to user" do

    add_other_users

    visit_user_management
    users = find_users
    user = get_user_by_role(users, @member_role)

    role_dropdown_cell(user).select(@user_role)
    find('#save-changes-btn').click

    sleep 2
    new_users = find_users

    assert_nil get_user_by_role(new_users, @member_role)
  end

end