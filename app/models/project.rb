class Project < ActiveRecord::Base
  belongs_to :user
  has_many :comment
  has_many :hearts
end
