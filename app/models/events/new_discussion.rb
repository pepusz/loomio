class Events::NewDiscussion < Event
  def self.publish(discussion)
    event = Events::NewDiscussion.create!(:kind => "new_discussion", :eventable => discussion)
    # TODO: potentially innefficient for large users
    discussion.group_users.each do |user|
      unless user == discussion.author
        event.notifications.create! :user => user
      end
    end
    event
  end
end