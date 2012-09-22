module Events
  class NewCommentDecorator < ::ApplicationDecorator
    decorates :new_comment, :class => Events::NewComment
  
    def eventable_path
      h.discussion_path(model.eventable.discussion)
    end
  end
end