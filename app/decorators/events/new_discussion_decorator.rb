module Events
  class NewDiscussionDecorator < ::ApplicationDecorator
    decorates :new_discussion, :class => Events::NewDiscussion
  
    def eventable_path
      h.discussion_path(model.discussion)
    end
  end
end