# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PvpTierTest < Minitest::Test
      def setup
        @pvp = BlizzardApi::Wow.pvp_tier
      end

      def test_pvp_tier_index
        pvp_data = @pvp.index
        assert pvp_data.key? :tiers
      end

      def test_pvp_tier_get
        pvp_data = @pvp.get 1
        assert_equal 'Unranked', pvp_data[:name][:en_US]
      end

      def test_pvp_tier_media
        pvp_data = @pvp.tier_media 1
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ui_rankedpvp_01.jpg', pvp_data[:assets][0][:value]
      end
    end
  end
end
