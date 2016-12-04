module MeetupWrapper
  class Client
    module Request

      def get(path, options = {})
        url = construct_url(path, options)
        HTTParty.get(url)
      end

      private
      def construct_url(path, options = {})
        query = construct_query(options)
        "#{self.class.base_uri}/#{path}?#{query}"
      end

      def construct_query(options = {})
        queryStr = ""
        options.each { |k,v| queryStr << "&#{k}=#{v}" }
        queryStr << "&sign=true&photo-host=public"
      end

    end
  end
end
