class TransferRoleTest < ActionDispatch::IntegrationTest

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
    sleep 2
    fill_in('user_email', :with => @super.email)
    fill_in('user_password', :with => @super.password)
    click_on('send-login-btn')
  end

  def visit_transfer_role
    visit("/")
    login
    click_on_user_mgnt
    sleep 2
    click_on('TRANSFERIR ROL')
    sleep 2
  end

  def find_members
    all('tbody tr')
  end

  def transfer_role_cell(member)
    member.all('td')[4]
  end

  test "transfer role without users" do 
    visit_transfer_role
    assert page.has_selector?(".dataTables_empty")
  end

  test "transfer role with users" do 
    @user.save!
    visit_transfer_role
    assert page.has_selector?(".dataTables_empty")
  end

  test "transfer role with members" do 
    @member.save!
    visit_transfer_role
    members = find_members
    assert_not_empty members
    member = members[0]
    transfer_role_cell(member).find('div.btn-danger div').click
    find("#transferBtn").click
    sleep 2
    assert_not page.has_selector?('#user-management-btn'), 'User Management Btn is active'
  end

end