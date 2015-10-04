require "faraday"
require "faraday_middleware"
require "eventum/connection/request"

module Eventum
  # Contains HTTP connection options
  #
  # @!attribute [r] request
  #   An {Eventum::Connection::Request} object
  class Connection
    attr_reader :request

    # Creates a new intance of {Eventum::Connection}
    #
    # @param config [Eventum::Configurable] a configuration object
    #
    # @return [Eventum::Connection]
    #
    # @api private
    def initialize(config)
      @config = config
    end

    # Performs an HTTP request
    #
    # @param method [Symbol] the HTTP method to perform
    # @param path [String] the path of the URL endpoint to request
    # @params body [Hash] the body of the request
    # @param headers [Hash] the headers of the request
    #
    # @return [Faraday::Response]
    #
    # @api private
    def execute(method:, path:, body: nil, headers: nil)
      rebuild_request(method, path, body, headers)
      conn.send(method) do |props|
        props.url request.path
        props.body = request.body
      end
    end

    private

    # The HTTP connection object
    #
    # @return [Faraday::Connection]
    #
    # @api private
    def conn
      Faraday.new(url: request.root_url) do |props|
        props.use FaradayMiddleware::FollowRedirects, limit: 1
        props.request :url_encoded
        props.adapter request.adapter
        props.headers = request.headers
      end
    end

    # The default headers for the request
    #
    # @return [Hash]
    #
    # @api private
    def default_headers
      {
        ACCEPT:       "application/json".freeze,
        CONTENT_TYPE: "application/json".freeze
      }
    end

    # Utility method used to rebuild the request on each call
    #
    # @param method [Symbol] the HTTP method to perform
    # @param path [String] the path of the URL endpoint to request
    # @params body [Hash] the body of the request
    # @param headers [Hash] the headers of the request
    #
    # @return [Eventum::Connection::Request]
    #
    # @api private
    def rebuild_request(method, path, body, headers)
      @request = Eventum::Connection::Request.new(
        method:  method,
        path:    path,
        body:    body,
        headers: default_headers.merge(headers.to_h),
        config:  @config
      )
    end
  end
end
