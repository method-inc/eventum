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
      #   client.events.find("stream-name", "0")
      #
      # @return [Hash]
      #
      # @api public
      def find(stream, number)
        get(path: "#{API_PATH}/#{stream}/#{number}")
      end

      # Write a new event to the given stream
      #
      # @param stream [String] the unique name of the stream
      # @param type [String] the event type
      # @param body [Hash] the event data
      #
      # @example
      #   type = "event-type"
      #   body = { data: "event data" }
      #
      #   client = Eventum.new
      #   client.events.create("stream-name", type: type, body: body)
      #
      # @return [Hash]
      #
      # @api public
      def create(stream, type:, body:)
        headers = { "ES-EventType" => type }
        post(path: "#{API_PATH}/#{stream}", body: body, headers: headers)
      end
    end
  end
end
