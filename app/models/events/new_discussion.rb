class Events::NewDiscussion < Event
  def self.publish(discussion)
    event = Events::NewDiscussion.create!(:kind => "new_discussion", :eventable => discussion, :actor => discussion.author)
    # TODO: potentially innefficient for large users
    discussion.group_users.each do |user|
      unless user == discussion.author
        event.notifications.create! :user => user
      end
    end
    event
  end
  
  def action_text
    "started a new discussion"
  end
  
  def title
    eventable.title
  end
  
  def group_name
    eventable.group_full_name
  end
end