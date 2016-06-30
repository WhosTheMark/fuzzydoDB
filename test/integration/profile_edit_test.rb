require 'test_helper'

class ProfileEditTest < ActionDispatch::IntegrationTest

	setup do
    Capybara.current_driver = :selenium
    @user1 = User.new(name: "Fuzzydo the Raccoon",
               username: "fuzzyraccoon",
               email: "raccoon@fuzzydo.db",
               password: "123123",
               password_confirmation: "123123")
    @user2 = User.new(name: "Fuzzydo the Raccoon!!",
               username: "fuzzyraccoon2",
               email: "xraccoonx@fuzzydo.db",
               password: "123123",
               password_confirmation: "123123",
               occupation: "Fuzzy database analyst",
               country: "US",
               institution: "University of Raccoons")

    @user1.save!
  end

  def teardown
    super
    User.delete_all
  end

  def visit_edit_profile
    visit("/")
    login
    visit("/profile/" + @user1.username + "/edit")
  end

  def login
    click_on('login-btn')
    sleep(2)
    fill_in('user_email', :with => @user1.email)
    fill_in('user_password', :with => @user1.password)
    click_on('send-login-btn')
  end

  def edit_name(name)
    fill_in('user_name', :with => name)
  end

  def edit_email(email)
    fill_in('user_email', :with => email)
  end

  def edit_occupation(occ)
    fill_in('user_occupation', :with => occ)
  end

  def edit_institution(inst)
    fill_in('user_institution', :with => inst)
  end

  def change_country(country)
    select(country, :from => 'user_country')
  end

  def has_name_error?
    page.has_selector?('#editNameError:not(.ng-inactive)')
  end

  def has_email_error?
    page.has_selector?('#editEmailError:not(.ng-inactive)')
  end

  test "profile edit is reachable" do 
    visit("/")
    login
    click_on(@user1.name)
    click_on("EDITAR PERFIL")
    assert true #Just to mark it reached this point
  end

  test "empty fields" do 
    visit_edit_profile
    edit_name ""
    force_blur('#user_name')
    assert has_name_error?
    edit_email ""
    force_blur('#user_email')
    assert has_email_error?
  end

  test "malformed mail" do 
    visit_edit_profile
    edit_email "nonvalidmail"
    force_blur('#user_email')
    assert has_email_error?
  end

  test "valid mail" do 
    visit_edit_profile
    edit_email "valid@mail.com"
    force_blur('#user_email')
    assert_not has_email_error?
  end

  test "edit succesfull" do 
    visit_edit_profile
    edit_email @user2.email
    edit_name @user2.name
    change_country "Estados Unidos"
    edit_institution @user2.institution
    edit_occupation @user2.occupation
    click_on "Guardar Cambios"
    assert_equal @user2.name, find("#user_name").text
    assert_equal @user2.email, find("#user_email").text
    assert_equal "Estados Unidos", find("#user_country").text
    assert_equal @user2.institution, find("#user_institution").text
    assert_equal @user2.occupation, find("#user_occupation").text
  end


end