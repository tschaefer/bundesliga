# frozen_string_literal: true

require 'httparty'

module Bundesliga
  class Agent
    attr_accessor :path

    include HTTParty
    headers 'Accept' => 'application/json', 'Content-Type' => 'application/json'
    base_uri 'https://api.openligadb.de'
    debug_output $stdout if %w[1 true].include?(ENV['BUNDESLIGA_DEBUG'])

    def initialize(path)
      @path = path
    end

    def get
      response = self.class.get(@path)
      raise OpenLigaDBError, 'No data found.' if !response.success? || response.parsed_response.empty?

      response.parsed_response
    end
  end

  class OpenLigaDBError < StandardError; end
end
