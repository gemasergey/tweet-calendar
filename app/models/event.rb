class Event < ActiveRecord::Base
  validates_presence_of :title, :user_id, :date
  belongs_to :user
  has_many :event_tags
  has_many :tags, through: :event_tags
  after_save :set_tags

  protected
  def set_tags
    message_tags = self.message.scan(/\B#\w+/)
    return if message_tags.empty?
    message_tags.each do |message_tag|
      tag = Tag.find_or_create_by(name: message_tag, user_id: user_id)
      self.event_tags.create(:tag_id => tag.id)
    end


  end
end
