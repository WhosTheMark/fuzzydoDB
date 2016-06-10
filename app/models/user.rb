class User
  include Mongoid::Document
  include SimpleEnum::Mongoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  field :username, type: String
  field :name, type: String
  as_enum :role, [:user, :member, :admin, :super_member], field: { :default => 0 }
  field :photo, type: String
  field :institution, type: String
  field :occupation, type: String
  field :country, type: String

  validates :username, presence: true, uniqueness: true, format: /\A\w*\z/
  validates :name, presence: true
  before_validation :drop_the_case
  mount_uploader :avatar, AvatarUploader

  def country_name
    name = ISO3166::Country.new(country)
    name.translations[I18n.locale.to_s] || country
  end

  def self.exists_username?(username)
    self.where(username: username.downcase).exists?
  end

  def self.exists_email?(email)
    self.where(email: email.downcase).exists?
  end


  def self.find_by_username username
    self.where(username: username)[0]
  end

  def admin_or_super_member?
    self.admin? || self.super_member?
  end

  # Checks if an int is associated to a role
  def self.role_exists?(int_role)
    !self.roles.value(int_role).nil?
  end

  # Admin and super_member cannot be set to other users
  def self.setteable_role?(int_role)
    !(User.roles.values_at(:admin, :super_member).include? int_role)
  end

  # Changes the roles of several users
  def self.change_roles(changed_users)

    unless changed_users.nil?

      users = self.all.entries

      changed_users.each do |changed_user|
        self.change_single_user_role(users, changed_user)
      end

    end
  end

  private

  # Changes the role of a single user
  # Admin and super user's roles cannot be changed and
  # user and member's roles cannot be set to admin or super member
  def self.change_single_user_role(users, changed_user)

    int_changed_role = Integer(changed_user["role"])
    user = users.find { |u| u.username == changed_user["username"] }

    if !user.admin_or_super_member? && self.role_exists?(int_changed_role) &&
      self.setteable_role?(int_changed_role)

      user.role_cd = int_changed_role
      user.save!
    end
  end

  def drop_the_case
    self.username = self.username.downcase unless self.username.nil?
    self.email = self.email.downcase unless self.email.nil?
  end
end
