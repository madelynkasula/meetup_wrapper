require_relative '../../../spec_helper'

describe MeetupWrapper::Client::Events do
  describe "event" do
    let(:client) { MeetupWrapper::Client.new }
    let(:response) { client.event("Girl-Develop-It-Chicago-IL", 233921596) }

    before do
      VCR.insert_cassette 'event', :record => :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it "must return the correct event id" do
      response["id"].must_equal 233921596.to_s
    end

    it "must return the correct group urlname" do
      response["group"]["urlname"].must_equal "Girl-Develop-It-Chicago-IL"
    end
  end
end
