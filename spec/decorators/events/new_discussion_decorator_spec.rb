require 'spec_helper'

describe Events::NewDiscussionDecorator do
  let(:discussion) { double("discussion", :to_param => '321') }
  let(:event)      { double("event", :discussion => discussion) }
  subject do
    Events::NewDiscussionDecorator.new(event)
  end

  before do
    c = ApplicationController.new
    c.request = ActionDispatch::TestRequest.new
    c.set_current_view_context
  end
  
  it "builds eventable path from discussion" do
    subject.eventable_path.should == "/discussions/321"
  end
end