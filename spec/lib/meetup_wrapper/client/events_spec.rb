require_relative '../../../spec_helper'

describe MeetupWrapper::Client::Events do
  let(:client) { MeetupWrapper::Client.new }

  describe "event" do
    let(:event) { client.event("Girl-Develop-It-Chicago-IL", 233921596) }

    before do
      VCR.insert_cassette 'event', :record => :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it "must return the correct event id" do
      event["id"].must_equal 233921596.to_s
    end

    it "must return the correct group urlname" do
      event["group"]["urlname"].must_equal "Girl-Develop-It-Chicago-IL"
    end
  end

  describe "events" do
    it "must return upcoming events by default" do
      VCR.use_cassette 'upcoming_events' do
        upcoming_events = client.events("Girl-Develop-It-Chicago-IL")

        upcoming_events.length.must_equal 2
        upcoming_events.first["status"].must_equal "upcoming"
        upcoming_events.last["status"].must_equal "upcoming"
      end
    end

    it "must return past events given that status is 'past'" do
      VCR.use_cassette 'past_events' do
        past_events = client.events("Girl-Develop-It-Chicago-IL", "past")

        anyNotPastEvents = past_events.any? { |e| e["status"] != "past" }
        anyNotPastEvents.must_equal false
      end
    end

    it "must return up to 20 events by default" do
      VCR.use_cassette 'past_events' do
        past_events = client.events("Girl-Develop-It-Chicago-IL", "past")

        past_events.length.must_equal 20
      end
    end

    it "must return a specified number of events given that 'page' is set" do
      VCR.use_cassette 'five_past_events' do
        past_events = client.events("Girl-Develop-It-Chicago-IL", "past", 5)

        past_events.length.must_equal 5
      end
    end
  end
end
