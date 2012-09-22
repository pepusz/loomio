class Event < ActiveRecord::Base
  KINDS = %w[new_discussion new_comment new_motion new_vote motion_blocked
             motion_closed membership_requested user_added_to_group comment_liked]

  has_many :notifications, :dependent => :destroy
  belongs_to :eventable, :polymorphic => true
  belongs_to :actor, :polymorphic => true

  validates_inclusion_of :kind, :in => KINDS
  validates_presence_of :eventable

  attr_accessible :kind, :eventable, :actor

  def self.new_discussion!(*params)
    Events::NewDiscussion.publish(*params)
  end

  def self.new_comment!(*params)
    Events::NewComment.publish(*params)
  end

  def self.new_motion!(*params)
    Events::NewMotion.publish(*params)
  end

  def self.motion_closed!(*params)
    Events::MotionClosed.publish(*params)
  end

  def self.new_vote!(vote)
    event = create!(:kind => "new_vote", :eventable => vote)
    begin
      unless vote.user == vote.motion_author
        event.notifications.create! :user => vote.motion_author
      end
      unless vote.user == vote.discussion_author
        event.notifications.create! :user => vote.discussion_author
      end
    rescue ActiveRecord::RecordInvalid => error
      # Catches error if we are trying to create duplicate notifications for
      # the same user (i.e. if motion author and discussion author are same person)
      raise unless error.message =~ /User has already been taken/
    end
    event
  end

  def self.motion_blocked!(vote)
    event = create!(:kind => "motion_blocked", :eventable => vote)
    vote.group_users.each do |user|
      unless user == vote.user
        event.notifications.create! :user => user
      end
    end
    event
  end

  def self.membership_requested!(membership)
    event = create!(:kind => "membership_requested", :eventable => membership)
    membership.group_admins.each do |admin|
      event.notifications.create! :user => admin
    end
    event
  end

  def self.user_added_to_group!(membership)
    event = create!(:kind => "user_added_to_group", :eventable => membership)
    event.notifications.create! :user => membership.user
    # Send email only if the user has already accepted invitation to Loomio
    if membership.user.accepted_or_not_invited?
      UserMailer.added_to_group(membership.user, membership.group).deliver
    end
    event
  end

  def self.comment_liked!(comment_vote)
    event = create!(:kind => "comment_liked", :eventable => comment_vote)
    unless comment_vote.user == comment_vote.comment_user
      event.notifications.create! :user => comment_vote.comment_user
    end
    event
  end

  def self.publish(*params)
    event = create_for_params!(*params)
    event.notify_users
    event
  end  

  def title
    eventable.title
  end
  
  def group_name
    eventable.group_full_name
  end  
  
  def notify_users
    # TODO: potentially innefficient for large users
    notifiable_users.find_each(:batch_size => 500) do |user|
      notifications.create! :user => user
    end
  end
  
end