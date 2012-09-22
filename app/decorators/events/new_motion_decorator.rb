module Events
  class NewMotionDecorator < ::ApplicationDecorator
    decorates :new_motion, :class => Events::NewMotion
  
    def eventable_path
      h.discussion_path(model.discussion)
    end
  end
end