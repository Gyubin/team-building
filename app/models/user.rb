class User < ActiveRecord::Base
  has_many :projects
  has_many :comments
  has_many :hearts
  has_many :messages
end
