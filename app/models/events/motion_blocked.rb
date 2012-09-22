class Events::MotionBlocked < Event
  def self.create_for_params!(vote)
    create!(:kind => "motion_blocked", :eventable => vote, :actor => vote.user)
  end
  
  def notifiable_users
    vote.group_users.not_including(actor)
  end
  
  def discussion
    vote.discussion
  end
  
  def vote
    eventable
  end
  
  def linkable_resource
    discussion
  end
  
  def action_text
    "blocked the proposal"
  end
  
  def title
    vote.motion_name
  end  
end