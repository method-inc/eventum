module Eventum
  class Client
    # API client for the `events` resource
    class Events < Eventum::API
      # The events API path
      #
      # @return [String]
      API_PATH = "/streams".freeze

      # Get a single event
      #
      # @param stream [String] the unique name of the stream
      # @param number [String] the event number
      #
      # @example
      #   client = Eventum.new
      #   client.events.find("stream-name", "event-number")
      #
      # @return [Hash]
      #
      # @api public
      def find(stream, number)
        get("#{API_PATH}/#{stream}/#{number}")
      end
    end
  end
end
