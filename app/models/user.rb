class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: {case_sensetive: false}
  has_many :events
  has_many :tags
end
