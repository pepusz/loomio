class Events::NewComment < Event
  def self.publish(comment)
    event = create!(:kind => "new_comment", :eventable => comment, :actor => comment.user)
    # TODO: potentially innefficient for large users
    comment.discussion_participants.each do |user|
      unless user == comment.user
        event.notifications.create! :user => user
      end
    end
    event
  end
  
  def action_text
    "commented on the discussion"
  end
  
  def title
    eventable.discussion.title
  end
  
  def group_name
    eventable.group_full_name
  end
end