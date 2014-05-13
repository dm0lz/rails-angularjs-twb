class Entry
  include Mongoid::Document
  field :name, type: String
  field :winner, type: Mongoid::Boolean
  validates :name, presence: true
end
