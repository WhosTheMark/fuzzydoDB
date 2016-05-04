class Member
  include Mongoid::Document

  field :member_id, type: String
  field :name, type: String
  field :photo, type: String

end
