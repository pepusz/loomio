class Events::NewDiscussionDecorator < ApplicationDecorator
  decorates :new_discussion, :class => Events::NewDiscussion
  
  def eventable_path
  end
end