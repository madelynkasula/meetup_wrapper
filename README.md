# meetup_wrapper
A gem that provides a wrapper around the Meetup API. This gem is currently in development, so please check back soon!

### Usage
To install: `gem install meetup_wrapper`  
To reference: `require 'meetup_wrapper'`

Create a new instance of your client: `MeetupWrapper.client`  

##### Get events for a Meetup group
`client.events("Group-UrlName-Here")`

Returns up to 20 events set as "upcoming" for this group by default. You can pass in optional parameters `page` and `status`. For example, let's get the past 5 events a group has had:

`client.events("Group-UrlName-Here", "past", 5)`

`status` must be one of: "proposed", "suggested", "draft", "cancelled", "past", or "upcoming"

##### Get a single event for a Meetup group
`client.event("Group-UrlName-Here", 123456)`

Returns event with id `123456` for this group.
