require 'test_helper'

class UserManagementTest < ActionDispatch::IntegrationTest

  setup do
    Capybara.current_driver = :selenium
    @user1 = User.new(name: "Fuzzydo the Racoon",
               username: "fuzzyracoon",
               email: "racoon@fuzzydo.db",
               password: "123123",
               password_confirmation: "123123")
  end

  def teardown
    super
    User.delete_all
  end

  def has_name_error?
    page.has_selector?('#regNameError:not(.ng-inactive)')
  end

  def has_username_error?
    page.has_selector?('#regUsernameError:not(.ng-inactive)')
  end

  def has_email_error?
    page.has_selector?('#regEmailError:not(.ng-inactive)')
  end

  def has_password_error?
    page.has_selector?('#regPassWordError:not(.ng-inactive)')
  end

  def has_password_confirmation_error?
    page.has_selector?('#regPassWordConfirmationError:not(.ng-inactive)')
  end

  # Wait to senconds because there is a js function
  # that autofucus the modals. It will mess up with
  # the tests
  def click_on_registration
    click_on('register-btn')
    sleep(2)
  end

  def click_on_send_registration
    click_on('send-registration-btn')
  end

  def click_on_log_out
    click_on('logout-btn')
  end

  def find_username_text
    find(:css, '.header-user-info strong').text
  end

  def register_user(user)
    fill_in('user_name', :with => user.name)
    fill_in('user_username', :with => user.username)
    fill_in('user_email', :with => user.email)
    fill_in('user_password', :with => user.password)
    fill_in('user_password_confirmation', :with => user.password_confirmation)
  end

  test "register user" do

    visit("/")

    # Fill the form to regiser the user
    click_on_registration
    register_user(@user1)
    click_on_send_registration

    # Check that the username match the registration
    assert_equal(@user1.name, find_username_text, 'Wrong username displayed')

    # Check that the buttons to register and login do not appear
    assert_not page.has_selector?('#register-btn'), 'Register button is active during session'
    assert_not page.has_selector?('#login-btn'), 'Login button is active during session'

  end

  test "register user redirects to the same page" do

    visit("/about")

    # Fill the form to regiser the user
    click_on_registration
    register_user(@user1)
    click_on_send_registration

    assert_equal(@user1.name, find_username_text, 'Wrong username displayed')
    assert has_current_path?('/about'), 'Wrong page after registration'
  end

  test "check empty validations" do

    visit('/')

    click_on_registration

    # Name empty
    fill_in('user_name', :with => "")
    force_blur('#user_name')
    assert has_name_error?, "Empty name error was not shown"

    # Username empty
    fill_in('user_username', :with => "")
    force_blur('#user_username')
    assert has_username_error?, "Empty username error was not shown"

    # Email empty
    fill_in('user_email', :with => "")
    force_blur('#modalRegister #user_email')
    assert has_email_error?, "Empty email error was not shown"

    # Password empty
    fill_in('user_password', :with => "")
    force_blur('#modalRegister #user_password')
    assert has_password_error?, "Empty password error was not shown"

    # Password confirmation empty
    fill_in('user_password_confirmation', :with => "")
    force_blur('#user_password_confirmation')
    assert has_password_confirmation_error?, "Empty password_confirmation error was not shown"

  end

  test "empty errors on submit" do

    visit('/')

    click_on_registration
    click_on_send_registration

    assert has_name_error?, "Empty name error was not shown"
    assert has_username_error?, "Empty username error was not shown"
    assert has_email_error?, "Empty email error was not shown"
    assert has_password_error?, "Empty password error was not shown"
    assert has_password_confirmation_error?, "Empty password_confirmation error was not shown"

  end

  test "malformed mail" do

    visit('/')
    click_on_registration

    fill_in('user_email', :with => "nonvalidmail")
    force_blur('#modalRegister #user_email')

    assert has_email_error?, "Invalid email error was not shown"
  end

  test "valid mail" do

    visit('/')
    click_on_registration

    fill_in('user_email', :with => "valid@mail.com")
    force_blur('#modalRegister #user_email')

    assert_not has_email_error?, "Invalid email error was shown"
  end


  test "invalid username with spaces" do

    visit('/')
    click_on_registration

    fill_in('user_username', :with => "my username")
    force_blur('#user_username')

    assert has_username_error?, "Invalid username error was not shown"
  end

  test "valid username with underscore" do

    visit('/')
    click_on_registration

    fill_in('user_username', :with => "my_username")
    force_blur('#user_username')

    assert_not has_username_error?, "Invalid username error was shown"
  end

  test "valid username" do

    visit('/')
    click_on_registration

    fill_in('user_username', :with => "myUsername")
    force_blur('#user_username')

    assert_not has_username_error?, "Invalid username error was shown"
  end

  test "register twice" do

    @user1.save!

    visit('/')

    click_on_registration
    register_user(@user1)

    assert has_username_error?, "Invalid username error was not shown"
    assert has_email_error?, "Invalid email error was not shown"

  end

  test "register twice capitalize" do
    visit('/')

    @user1.save!

    click_on_registration
    fill_in('user_username', :with => @user1.username.upcase)
    fill_in('user_email', :with => @user1.email.upcase)
    force_blur('#modalRegister #user_email')

    assert has_username_error?, "Invalid username error was not shown"
    assert has_email_error?, "Invalid email error was not shown"

  end

  test "register twice leading spaces" do
    visit('/')

    @user1.save!

    click_on_registration
    fill_in('user_username', :with => " " + @user1.username)
    fill_in('user_email', :with => " " + @user1.email)
    force_blur('#modalRegister #user_email')

    assert has_username_error?, "Invalid username error was not shown"
    assert has_email_error?, "Invalid email error was not shown"

  end

  test "register twice trailing spaces" do
    visit('/')

    @user1.save!

    click_on_registration
    fill_in('user_username', :with => @user1.username + " ")
    fill_in('user_email', :with => @user1.email + " ")
    force_blur('#modalRegister #user_email')

    assert has_username_error?, "Invalid username error was not shown"
    assert has_email_error?, "Invalid email error was not shown"

  end

  #Redirect to same page
  #Validations
  #Wrong login
  #same user/email
  #Capitalize email/user
  #Stay in same page after login

end
