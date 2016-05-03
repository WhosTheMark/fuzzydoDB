class Member
  include Mongoid::Document

  field :memberId, type: String
  field :name, type: String
  field :photo, type: String
  field :bio, type: String,  localize: true

end