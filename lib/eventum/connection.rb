require "faraday"

module Eventum
  # Contains HTTP connection options
  class Connection
    # Performs an HTTP request
    #
    # @param method [Symbol] the HTTP method to perform
    # @param path [String] the path of the URL endpoint to request
    # @param config [Eventum::Configurable] a configuration object
    #
    # @return [Faraday::Response]
    #
    # @api private
    def execute(method:, path:, config:)
      conn(config).send(method) do |request|
        request.url path
      end
    end

    private

    # The HTTP connection object
    #
    # @param config [Eventum::Configurable] a configuration object
    #
    # @return [Faraday::Connection]
    #
    # @api private
    def conn(config)
      Faraday.new(url: "#{config.host}:#{config.port}") do |faraday|
        faraday.request :url_encoded
        faraday.adapter config.adapter
        faraday.headers = headers
      end
    end

    # The default headers for the request
    #
    # @return [Hash]
    #
    # @api private
    def headers
      {
        ACCEPT:       "application/json".freeze,
        CONTENT_TYPE: "application/json".freeze
      }
    end
  end
end
