require "httparty"
require_relative "meetup_wrapper/client"

module MeetupWrapper

  def self.client
    MeetupWrapper::Client.new
  end

end
