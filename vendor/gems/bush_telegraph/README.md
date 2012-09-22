# BushTelegraph

This project rocks and uses MIT-LICENSE.

## TODO

* Event should not be dependent on any classes not in BushTelegraph
* Being dependent on a user is ok, as long as the application can define the user class to use

Ideas for event polymorphism:

```ruby
BushTelegraph.register_event_type Loomio::Events::NewDiscussion, :new_discussion
```