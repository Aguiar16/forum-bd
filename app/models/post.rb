class Post < ApplicationRecord
  belongs_to :topic, :optional => true
  has_many :replys
end
