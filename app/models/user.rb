class User
  include Mongoid::Document
  field :username, type: String
  field :name, type: String
  field :email, type: String
end
