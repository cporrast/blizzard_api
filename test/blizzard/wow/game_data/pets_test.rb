# frozen_string_literal: true

require 'test_helper'

module BlizzardApi
  module Wow
    class PetTest < Minitest::Test
      def setup
        @pet = BlizzardApi::Wow.pet
      end

      def test_pet_index
        pet_data = @pet.index
        assert pet_data.key? :pets
      end

      def test_pet_get
        pet_data = @pet.get 39
        assert_equal 'Mechanical Squirrel', pet_data[:name][:en_US]
      end

      def test_pet_media
        pet_data = @pet.media 39
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/inv_pet_mechanicalsquirrel.jpg', pet_data[:assets][0][:value]
      end

      def test_pet_ability_index
        pet_data = @pet.abilities
        assert pet_data.key? :abilities
      end

      def test_pet_ability_get
        pet_data = @pet.ability 110
        assert_equal 'Bite', pet_data[:name][:en_US]
      end

      def test_pet_ability_media
        pet_data = @pet.ability_media 110
        assert_equal 'https://render.worldofwarcraft.com/us/icons/56/ability_druid_ferociousbite.jpg', pet_data[:assets][0][:value]
      end
    end
  end
end
