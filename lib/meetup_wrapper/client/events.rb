module MeetupWrapper
  class Client
    module Events

      def event(urlname, id)
        url = "#{self.class.base_uri}/#{urlname}/events/#{id}?&sign=true&photo-host=public"
        HTTParty.get(url)
      end

    end
  end
end
