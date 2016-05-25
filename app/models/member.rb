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

  validates :member_id, presence: true, uniqueness: true
  validates :name     , presence: true
  validates :email    , presence: true, uniqueness: true

end
