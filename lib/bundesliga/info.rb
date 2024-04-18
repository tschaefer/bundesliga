# frozen_string_literal: true

module Bundesliga
  class Info
    attr_reader :league, :matchday

    def initialize(league:, matchday:)
      @league = league
      @matchday = matchday
    end
  end
end
