# frozen_string_literal: true

require 'bundesliga/matchday'
require 'bundesliga/standings'
require 'bundesliga/version'

module Bundesliga
  class << self
    def matchday(league: 'bl1')
      Bundesliga::Matchday.new(league:)
    end

    def standings(league: 'bl1')
      Bundesliga::Standings.new(league:)
    end
  end
end
