require 'spec_helper'

describe Events::NewDiscussionDecorator do
  let(:discussion) { double("discussion", :id => 123) }
  let(:event)      { double("event", :eventable => discussion) }
  subject do
    Events::NewDiscussionDecorator.new(event)
  end

  before do
    c = ApplicationController.new
    c.request = ActionDispatch::TestRequest.new
    c.set_current_view_context
  end
  
  it "builds eventable path from discussion" do
    subject.h.should_receive(:discussion_path).with(discussion).and_return('somepath')
    subject.eventable_path.should == "somepath"
  end
end