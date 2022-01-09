# frozen_string_literal: true

module BlizzardApi
  module Wow
    ##
    # This class allows access to World of Warcraft mounts
    #
    # @see https://develop.battle.net/documentation/api-reference/world-of-warcraft-game-data-api
    #
    # You can get an instance of this class using the default region as follows:
    #   api_instance = BlizzardApi::Wow.mount
    class Mount < Wow::GenericDataEndpoint
      include BlizzardApi::Wow::Searchable

      setup 'mount', :static, CACHE_TRIMESTER
    end
  end
end
