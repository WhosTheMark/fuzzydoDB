class User
  include Mongoid::Document
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
  field :email, type: String

  validates :username, presence: true, uniqueness: true, format: /\A\w*\z/
  validates :name, presence: true
  before_validation :drop_the_case

  def self.exists_username?(username)
    self.where(username: username.downcase).exists?
  end

  def self.exists_email?(email)
    self.where(email: email.downcase).exists?
  end

  private

  def drop_the_case
    begin
      self.username = self.username.downcase
      self.email = self.email.downcase
      raise
    rescue
      puts "username is nil in drop_the_case" if self.username.nil?
      puts "email is nil in drop_the_case" if self.email.nil?
    ensure
      self.destroy
      puts "user can not be created"
    end
  end

end
