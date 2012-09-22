class Events::MotionClosed < Event
  def self.create_for_params!(motion, closer)
    create!(:kind => "motion_closed", :eventable => motion, :actor => closer)
  end
  
  def notifiable_users
    motion.group_users.not_including(actor)
  end
  
  def discussion
    motion.discussion
  end
  
  def motion
    eventable
  end
  
  def linkable_resource
    discussion
  end
  
  def action_text
    "closed the proposal"
  end
  
  def title
    motion.name
  end  
end