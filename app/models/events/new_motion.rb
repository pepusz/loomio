class Events::NewMotion < Event
  def self.create_for_params!(motion)
    create!(:kind => "new_motion", :eventable => motion, :actor => motion.author)
  end
  
  def notifiable_users
    motion.group_users.not_including(motion.author)
  end
  
  def motion
    eventable
  end
  
  def discussion
    motion.discussion
  end
  
  def action_text
    "created a new proposal"
  end  

  def title
    motion.title
  end
end