class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :followed, class_name: 'User'
  after_create :create_chatroom

  def create_chatroom
    follow = Follow.find_by(user: followed, followed: user)
    return unless follow

    @chatroom = Chatroom.find_or_create_by(user: user, followed: followed)
  end
end
