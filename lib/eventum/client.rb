module Eventum
  # Client for the Event Store API
  #
  # @includes {Eventum::Configurable}
  class Client
    include Eventum::Configurable

    # Creates a new instance of {Eventum::Client}
    #
    # @yield [self]
    #   A configurable object
    #
    # @example
    #   Eventum::Client.new do |config|
    #     config.adapter = :excon
    #     config.host = "http://localhost"
    #     config.port = 2121
    #   end
    #
    # @return [Eventum::Client]
    #
    # @api public
    def initialize
      yield self if block_given?
    end

    # Points to a `streams` API client
    #
    # @return [Eventum::Client::Streams]
    #
    # @api public
    def streams
      @streams ||= Eventum::Client::Streams.new(self)
    end

    # Points to an `events` API client
    #
    # @return [Eventum::Client::Events]
    #
    # @api public
    def events
      @events ||= Eventum::Client::Events.new(self)
    end
  end
end
