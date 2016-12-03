module MeetupWrapper
  class Client
    module Events

      def event(url_name, id)
        url = "#{self.class.base_uri}/#{url_name}/events/#{id}?&sign=true&photo-host=public"
        HTTParty.get(url)
      end

    end
  end
end
