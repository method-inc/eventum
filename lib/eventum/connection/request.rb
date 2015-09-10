module Eventum
  class Connection
    # Holds properties for a single request
    #
    # @!attribute [r] body
    #   The request body
    #
    # @!attribute [r] headers
    #   The request headers
    #
    # @!attribute [r] method
    #   The request HTTP method
    #
    # @!attribute [r] path
    #   The request endpoint path
    class Request
      attr_reader :body, :headers, :method, :path

      # Creates a new {Eventum::Connection::Request} object
      #
      # @param method [Symbol] the HTTP method of this request
      # @param path [String] the path of the request
      # @param body [Hash] the body of the request
      # @param headers [Hash] the headers of the request
      # @param config [Eventum::Configurable] a configuraion object
      #
      # @return [Eventum::Connection::Request]
      #
      # @api private
      def initialize(method:, path:, body:, headers:, config:)
        @method = method
        @path = path
        @body = body.to_json
        @headers = headers
        @config = config
      end

      # Returns the root url for this request
      #
      # @return [String]
      #
      # @api private
      def root_url
        @root_url ||= "#{@config.host}:#{@config.port}"
      end

      # A wrapper to the configurable object adapter
      #
      # @return [Symbol]
      #
      # @api private
      def adapter
        @config.adapter
      end
    end
  end
end
