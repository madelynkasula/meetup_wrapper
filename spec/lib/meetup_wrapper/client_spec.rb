require_relative '../../spec_helper'

describe MeetupWrapper::Client do
  let(:client) { MeetupWrapper::Client }

  describe "default attributes" do
    it "must include httparty methods" do
      client.must_include HTTParty
    end

    it "must have the base url set to the Meetup API endpoint" do
      client.base_uri.must_equal 'https://api.meetup.com'
    end
  end
end
