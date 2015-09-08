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
    #
    # @return [Faraday::Response]
    #
    # @api private
    def get(path)
      connection.execute(method: :get, path: path, config: @config)
    end

    # Points to an {Eventum::Connection} object
    #
    # @return [Eventum::Connection]
    #
    # @api private
    def connection
      @connection ||= Eventum::Connection.new
    end
  end
end
