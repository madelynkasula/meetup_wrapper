require_relative "client/events"

module MeetupWrapper
  class Client
    include HTTParty
    include MeetupWrapper::Client::Events

    base_uri 'https://api.meetup.com'
  end
end
