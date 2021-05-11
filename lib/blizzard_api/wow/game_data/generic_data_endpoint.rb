# frozen_string_literal: true

require 'thwait'

module BlizzardApi
  module Wow
    ##
    # Generic endpoint to support most data requests with minor configurations
    class GenericDataEndpoint < Wow::Request
      ##
      # @!macro regions
      def initialize(region = nil, mode = :regular)
        super region, mode
        endpoint_setup
        @ttl ||= CACHE_DAY
      end

      ##
      # Fetch a list of all resources available for this endpoint
      #
      # @!macro request_options
      # @!macro response
      def index(**options)
        api_request "#{endpoint_uri}/index", **default_options.merge(options)
      end

      ##
      # Fetch all possible data for one of the items listed by the {#index} using its *id*
      #
      # @param id [Integer] One of the IDs returned by the {#index}
      # @!macro request_options
      #
      # @!macro response
      def get(id, **options)
        api_request "#{endpoint_uri}/#{id}", **default_options.merge(options)
      end

      ##
      # @!macro complete
      def complete(**options)
        payload = [].tap do |complete_data|
          index_data = index(**options)
          threads = []

          concurrency = options.key?(:concurrency) ? options[:concurrency].to_i : BlizzardApi.concurrency
          concurrency.times do
            threads << Thread.new do
              while index_data[@collection.to_sym].size.positive?
                item = index_data[@collection.to_sym].pop
                link = item.key?(:key) ? item[:key][:href] : item[:href]
                item_data = request link
                complete_data.push item_data
              end
            end
          end
          ThreadsWait.all_waits threads
        end
        payload.sort { |a, b| a[:id] <=> b[:id] }
      end

      protected

      def endpoint_uri(variant = nil, scope = :game_data)
        endpoint = variant ? "#{@endpoint}-#{variant}" : @endpoint
        "#{base_url(scope)}/#{endpoint}"
      end

      def endpoint_setup
        raise NotImplementedError, 'You must override this method to properly set up the endpoint'
      end

      def default_options
        { namespace: @namespace, ttl: @ttl }
      end
    end
  end
end
