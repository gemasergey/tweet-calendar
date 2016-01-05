class Tag < ActiveRecord::Base
  validates_presence_of :name, :user_id
  has_many :event_tags
  has_many :events, through: :event_tags
  belongs_to :user
end
