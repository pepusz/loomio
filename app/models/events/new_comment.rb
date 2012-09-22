class Events::NewComment < Event
  def self.create_for_params!(comment)
    create!(:kind => "new_comment", :eventable => comment, :actor => comment.user)
  end
  
  def notifiable_users
    comment.discussion_participants.not_including(comment.user)
  end
  
  def comment
    eventable
  end
  
  def action_text
    "commented on the discussion"
  end
  
  def title
    eventable.discussion.title
  end  
end