require 'test_helper'

class ProfileEditTest < ActionDispatch::IntegrationTest

  setup do
    Capybara.current_driver = :selenium
    @user1 = User.new(name: "Fuzzydo the Raccoon",
               username: "fuzzyraccoon",
               email: "raccoon@fuzzydo.db",
               password: "123123",
               password_confirmation: "123123")
    @user1.save!
  end

  def teardown
    super
    User.delete_all
  end

  def visit_edit_password
    visit("/")
    login
    visit("/profile/" + @user1.username + "/update_password")
  end

  def login
    click_on('login-btn')
    sleep(2)
    fill_in('user_email', :with => @user1.email)
    fill_in('user_password', :with => @user1.password)
    click_on('send-login-btn')
  end

  def edit_current_password(password)
    fill_in('user_current_password', :with => password)
  end

  def edit_password(password)
    fill_in('user_password', :with => password)
  end

  def edit_password_confirmation(password)
    fill_in('user_password_confirmation', :with => password)
  end

  def has_current_password_error?
    page.has_selector?('#currentPasswordError:not(.ng-inactive)')
  end

  def has_password_error?
    page.has_selector?('#passwordError:not(.ng-inactive)')
  end

  def has_password_confirmation_error?
    page.has_selector?('#passwordConfirmationError:not(.ng-inactive)')
  end

  test "edit password is reacheable" do 
    visit("/")
    login
    click_on(@user1.name)
    click_on("EDITAR CONTRASEÑA")
    assert true #Just to mark it reached this point
  end

  test "empty fields" do
    visit_edit_password
    edit_current_password ""
    force_blur('#user_current_password')
    assert has_current_password_error?
    edit_password ""
    force_blur('#user_password')
    assert has_password_error?
    edit_password_confirmation ""
    force_blur('#user_password_confirmation')
    assert has_password_confirmation_error?
  end

  test "passwords are not long enough" do
    visit_edit_password
    edit_current_password "123"
    force_blur('#user_current_password')
    assert has_current_password_error?
    edit_password "123"
    force_blur('#user_password')
    assert has_password_error?
    edit_password_confirmation "123"
    force_blur('#user_password_confirmation')
    assert has_password_confirmation_error?
  end

  test "passwords are not the same" do
    visit_edit_password
    edit_password "1234567"
    edit_password_confirmation "1234568"
    force_blur('#user_password_confirmation')
    assert has_password_confirmation_error?
  end

  test "passwords are ok" do
    visit_edit_password
    edit_current_password "123123"
    edit_password "1234568"
    edit_password_confirmation "1234568"
    click_on "Guardar Cambios"
  end

end
