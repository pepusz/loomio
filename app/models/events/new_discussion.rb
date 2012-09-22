class Events::NewDiscussion < Event
  def self.create_for_params!(discussion)
    create!(:kind => "new_discussion", :eventable => discussion, :actor => discussion.author)
  end
  
  def notifiable_users
    discussion.group_users.not_including(discussion.author)
  end
  
  def discussion
    eventable
  end
  
  def action_text
    "started a new discussion"
  end  
end