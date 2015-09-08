module Eventum
  # Major release version describes incompatible API changes
  #
  # @return [Integer]
  MAJOR = 0

  # Minor release version describes new backwards-compatible functionality
  #
  # @return [Integer]
  MINOR = 0

  # Patch release version describes backwards-compatible bug fixes
  #
  # @return [Integer]
  PATCH = 1

  # Full release version that follows Semantic Versioning 2.0.0
  #
  # @return [String]
  VERSION = [MAJOR, MINOR, PATCH].join(".").freeze
end
