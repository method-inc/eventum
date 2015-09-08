require "virtus"

module Eventum
  # Configuration options for {self} with default values
  #
  # @!attribute [rw] adapter
  #   The adapter to be used by Faraday. Defaults to `:net_http`. Other
  #   options include `:typhoeus`, `:patron`, `:excon`, `:test`
  #
  # @!attribute [rw] host
  #   The host of the Event Store instance. Defaults to `http://localhost`
  #
  # @!attribute [rw] port
  #   The port of the Event Store instance. Defaults to `2113`
  module Configurable
    include Virtus.module(constructor: false, coerce: false)

    # Default Faraday adapter
    #
    # @return [Symbol]
    ADAPTER = :net_http

    # Default Event Store host
    #
    # @return [String]
    HOST = "http://localhost".freeze

    # Default Event Store port
    #
    # @return [String]
    PORT = "2113".freeze

    attribute :adapter, String, default: ADAPTER, lazy: true
    attribute :host, String, default: HOST, lazy: true
    attribute :port, String, default: PORT, lazy: true

    # Allows to configure {self}
    #
    # @example
    #   Eventum.configure do |config|
    #     config.adapter = :typhoeus
    #     config.host = "http://localhost"
    #     config.port = 2121
    #   end
    #
    # @yield [self]
    #   A configurable object
    #
    # @return [nil]
    #
    # @api public
    def configure
      yield self if block_given?
    end

    # List of configuration properties
    #
    # @return [Array]
    #
    # @api public
    def config_props
      %i(adapter host port)
    end

    # Resets the configuration properties to default values
    #
    # @return [nil]
    #
    # @api public
    def reset!
      config_props.each do |prop|
        instance_variable_set(:"@#{prop}", defaults[prop])
      end
    end

    private

    # Holds default configuration
    #
    # @return [Hash]
    #
    # @api private
    def defaults
      {
        adapter: ADAPTER,
        host:    HOST,
        port:    PORT
      }.freeze
    end
  end
end
