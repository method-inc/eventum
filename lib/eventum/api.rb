module Eventum
  # Core API interface
  class API
    # Creates a new instance of kind {Eventum::API}
    #
    # @param config [Eventum::Configurable] a configuration object
    #
    # @return [Eventum::API]
    #
    # @api public
    def initialize(config)
      @config = config
    end

    private

    # Executes a GET request on the given path
    #
    # @param path [String] the path of the endpoint to request
    # @param body [Hash] the body of the post request
    # @param headers [Hash] the headers of the post request
    #
    # @return [Faraday::Response]
    #
    # @api private
    def get(path:, headers: nil)
      connection.execute(
        method:  :get,
        path:    path,
        headers: headers
      )
    end

    # Executes a POST request on the given path
    #
    # @param path [String] the path of the endpoint to request
    # @param body [Hash] the body of the post request
    # @param headers [Hash] the headers of the post request
    #
    # @return [Faraday::Response]
    #
    # @api private
    def post(path:, body: nil, headers: nil)
      connection.execute(
        method:  :post,
        path:    path,
        body:    body,
        headers: headers
      )
    end

    # Points to an {Eventum::Connection} object
    #
    # @return [Eventum::Connection]
    #
    # @api private
    def connection
      @connection ||= Eventum::Connection.new(@config)
    end
  end
end
