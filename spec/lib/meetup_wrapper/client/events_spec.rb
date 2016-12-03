require_relative '../../../spec_helper'

describe MeetupWrapper::Client::Events do

  describe "get event" do
    let(:client) { MeetupWrapper::Client.new }

    before do
      VCR.insert_cassette 'event', :record => :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it "must return the correct event id" do
      response = client.event("Girl-Develop-It-Chicago-IL", 233921596)
      response["id"].must_equal 233921596.to_s
    end

  end

end
