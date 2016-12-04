require_relative "request"
require_relative "client/events"

module MeetupWrapper
  class Client
    include HTTParty
    include MeetupWrapper::Client::Request
    include MeetupWrapper::Client::Events

    base_uri 'https://api.meetup.com'
  end
end
