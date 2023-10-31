# frozen_string_literal: true

module BlizzardApi
  # Global configurations
  module Configuration
    ##
    # @!attribute app_id
    #   Application ID.
    #   @see https://develop.battle.net/access/clients
    #   @return [String] Application ID
    attr_accessor :app_id

    ##
    # @!attribute app_secret
    #   Application secret.
    #   @see https://develop.battle.net/access/clients
    #   @return [String] Application secret
    attr_accessor :app_secret

    ##
    # @!attribute region
    #   Default region.
    #   @return [String] Default region
    attr_accessor :region

    ##
    # @!attribute mode
    #   Api response mode :regular or :extended.
    #   @return [Symbol] Default API response mode
    attr_accessor :mode

    ##
    # @!attribute use_cache
    #   If true requests will be cached using a Redis server.
    #   @see https://redis.io/
    #   @return [Boolean] Application ID
    attr_accessor :use_cache

    ##
    # @!attribute redis_host
    #   Redis host.
    #   @see https://redis.io/
    #   @return [String] Redis host
    attr_accessor :redis_host

    ##
    # @!attribute redis_port
    #   Redis port.
    #   @see https://redis.io/
    #   @return [Integer] Redis port
    attr_accessor :redis_port

    ##
    # @!attribute redis_url
    #   Redis url.
    #   @see https://redis.io/
    #   @return [String] Redis url
    attr_accessor :redis_url

    ##
    # @!attribute redis_database
    #   Redis databse.
    #   @see https://redis.io/
    #   @return [Integer] Redis database
    attr_accessor :redis_database

    ##
    # @!attribute cache_access_token
    #   If set to true and cache is enabled the current access token will be cached and recovered from Redis
    #   @return [Boolean] Access token.
    attr_accessor :cache_access_token

    ##
    # This method return the singleton instance of the configuration module. Use this to initialize the default values
    # and options.
    #
    # @yield self
    #
    # @example
    #   BlizzardApi.configure do |config|
    #     config.app_id = ENV['BNET_APPLICATION_ID']
    #     config.app_secret = ENV['BNET_APPLICATION_SECRET']
    #     config.region = 'us'
    #
    #     config.use_cache = true
    #     config.redis_host = ENV['REDIS_HOST']
    #     config.redis_port = ENV['REDIS_PORT']
    #   end
    def configure
      yield self
    end

    ##
    # Initializes some default values for the main module
    def self.extended(base)
      base.redis_port = 1
      base.mode = :regular
    end
  end
end
