module Eventum
  class Client
    # API client for the `streams` resource
    class Streams < Eventum::API
      # The streams API path
      #
      # @return [String]
      API_PATH = "/streams".freeze

      # Get a single stream
      #
      # @param name [String] the unique name of the stream
      #
      # @example
      #   client = Eventum.new
      #   client.streams.find("stream-name")
      #
      # @return [Hash]
      #
      # @api public
      def find(name)
        get("#{API_PATH}/#{name}")
      end
    end
  end
end
