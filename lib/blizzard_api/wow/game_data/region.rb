# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft regions
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.region
    class Region < Wow::GenericDataEndpoint
      setup 'region', :dynamic, CACHE_QUARTER_HOUR
    end
  end
end
