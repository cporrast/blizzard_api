# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PvpRegionTest < Minitest::Test
      def setup
        @pvp = BlizzardApi::Wow.pvp_region
      end

      def test_pvp_region_index
        pvp_data = @pvp.index classic: true
        assert pvp_data.key? :pvp_regions
      end

      def test_pvp_regional_season_index
        pvp_data = @pvp.seasons 1, classic: true
        assert pvp_data.key? :seasons
      end

      def test_pvp_regional_season
        pvp_data = @pvp.season 1, 1, classic: true
        assert_equal 1623769200000, pvp_data[:season_start_timestamp]
      end

      def test_pvp_season_leaderboards
        pvp_data = @pvp.leaderboards 1, 1, classic: true
        assert_equal 3, pvp_data[:leaderboards].count
      end

      def test_pvp_season_leaderboard
        pvp_data = @pvp.leaderboard 1, 1, '3v3', classic: true
        assert_equal 5_000, pvp_data[:entries].count
      end

      def test_pvp_season_rewards
        pvp_data = @pvp.rewards 1, 1, classic: true
        assert_equal 15, pvp_data[:rewards].count
      end
    end
  end
end
