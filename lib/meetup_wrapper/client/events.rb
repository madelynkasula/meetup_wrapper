module MeetupWrapper
  class Client
    module Events
      
      def event(urlname, id)
        path = "#{urlname}/events/#{id}"
        get(path)
      end

      def events(urlname, status = "upcoming", page = 20)
        path = "#{urlname}/events"
        query = { status: status, page: page }
        get(path, query)
      end

    end
  end
end
