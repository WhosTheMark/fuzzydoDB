class Member
  include Mongoid::Document

  field :member_id, type: String
  field :name, type: String
  field :email, type: String
  field :photo, type: String

  def self.get_by_id(id)
    self.where(member_id: id)[0]
  end

  def self.get_non_developers()
    self.where(_type: "Member")
  end

end
