class Member
  include Mongoid::Document

  field :member_id, type: String
  field :name, type: String
  field :email, type: String
  field :photo, type: String
  embeds_many :articles

  def self.get_by_id(id)
    self.where(member_id: id)[0]
  end

  def self.get_non_developers()
    Member.all - Developer.all
  end

  def strip_whitespace
    self.member_id = self.member_id.strip unless self.member_id.nil?
    self.email = self.email.strip unless self.email.nil?
  end


  validates :member_id, presence: true, uniqueness: true
  validates :name     , presence: true
  validates :email    , presence: true, uniqueness: true, format: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  before_validation :strip_whitespace, :only => [:member_id, :email]

end
