# require 'spec_helper'
# 
# describe "notifications/_notification.html.haml" do
#   let(:author)         { double("author") }
#   let(:discussion)     { double("discussion", :author => author, :title => "Some discussion", :group_full_name => 'abc') }
#   let(:new_discussion) { Events::NewDiscussion.new }
#   let(:notification)   { 
#     double('notification', 
#       :id => 123, 
#       :event_kind => 'new_discussion', 
#       :event => new_discussion,
#       :discussion => discussion
#     ) }
#   
#   it "renders values from the decorator into a list item" do
#     render :partial => "notifications/notification.html.haml", :locals => {:notification => notification}
#   end
# end