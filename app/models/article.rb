class Article
  include Mongoid::Document

  field :authors, type: String
  field :description, type: String
  embedded_in :member
end