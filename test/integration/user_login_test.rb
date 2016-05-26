require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  setup do
    Capybara.current_driver = :selenium
    @user1 = User.new(name: "Fuzzydo the Racoon",
               username: "fuzzyracoon",
               email: "racoon@fuzzydo.db",
               password: "123123",
               password_confirmation: "123123")
    @user1.save!
  end

  def teardown
    super
    User.delete_all
  end

  def has_login_error?
    page.has_selector?('#loginError:not(.ng-inactive)')
  end

  def has_email_error?
    page.has_selector?('#loginEmailError:not(.ng-inactive)')
  end

  def has_password_error?
    page.has_selector?('#loginPassError:not(.ng-inactive)')
  end

  def click_on_log_in
    click_on('login-btn')
    sleep(2)
  end

  def click_on_send_login
    click_on('send-login-btn')
  end

  def click_on_log_out
    click_on('logout-btn')
  end

  def fill_login_with_user(user)
    fill_in('user_email', :with => user.email)
    fill_in('user_password', :with => user.password)
  end

  def fill_login(email, password)
    fill_in('user_email', :with => email)
    fill_in('user_password', :with => password)
  end

  def find_username_text
    find(:css, '.header-user-info strong').text
  end


  test "successfull login and logout" do

    visit("/")
    click_on_log_in
    fill_login_with_user(@user1)
    click_on_send_login

    # Check that the username shown matches the one that just registred
    assert_equal(@user1.name, find_username_text, 'Wrong username displayed')

    # Check that the buttons to register and login do not appear
    assert_not page.has_selector?('#register-btn'), 'Register button is active during session'
    assert_not page.has_selector?('#login-btn'), 'Login button is active during session'

    click_on_log_out

    # Check that the buttons to register and login do not appear
    assert page.has_selector?('#register-btn'), 'Register button is not active'
    assert page.has_selector?('#login-btn'), 'Login button is not active'
  end

  test "successfull login takes you to the same page" do

    visit("/about")
    click_on_log_in
    fill_login_with_user(@user1)
    click_on_send_login

    assert_equal(@user1.name, find_username_text, 'Wrong username displayed')
    assert has_current_path?('/about'), 'Wrong page after registration'
  end

  test "empty fields" do

    visit("/")
    click_on_log_in
    fill_login("","")
    force_blur("#modalLogin #user_password")

    assert has_email_error?, "Email error was not displayed"
    assert has_password_error?, "Email error was not displayed"

  end

  test "wrong data" do

    visit("/")
    click_on_log_in
    fill_login("notfuzzy@do.db", "321321")
    click_on_send_login

    assert has_login_error?, "Login error was not displayed"

  end

  test "invalid email" do

    visit("/")
    click_on_log_in
    fill_in('user_email', :with => "invalid e mail")
    force_blur("#modalLogin #user_email")

    assert has_email_error?, "Email error was not displayed"

  end

  test "successfull login with caps email" do

    visit("/")
    click_on_log_in
    fill_login(@user1.email.upcase, @user1.password)
    click_on_send_login

    # Check that the buttons to register and login do not appear
    assert_not page.has_selector?('#register-btn'), 'Register button is active during session'
    assert_not page.has_selector?('#login-btn'), 'Login button is active during session'

  end

  test "successfull login with trailing spaces email" do

    visit("/")
    click_on_log_in
    fill_login(@user1.email + " ", @user1.password)
    click_on_send_login
    # Check that the buttons to register and login do not appear
    assert_not page.has_selector?('#register-btn'), 'Register button is active during session'
    assert_not page.has_selector?('#login-btn'), 'Login button is active during session'

  end

  test "successfull login with leading spaces email" do

    visit("/")
    click_on_log_in
    fill_login(@user1.email, @user1.password)
    click_on_send_login

    # Check that the buttons to register and login do not appear
    assert_not page.has_selector?('#register-btn'), 'Register button is active during session'
    assert_not page.has_selector?('#login-btn'), 'Login button is active during session'

  end

  test "open registration on login modal" do

    visit("/")
    click_on_log_in
    #click_on('login-open-registration')

    page.find('#login-open-registration').click

    # Check that the buttons to register and login do not appear
    assert page.has_selector?('#modalRegister.fade.in'), 'Registration modal is not active'

  end

end