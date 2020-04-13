class Post < ApplicationRecord
  belongs_to :topic
  has_many :replies, :dependent => :destroy
end
