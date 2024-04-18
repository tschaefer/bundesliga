# frozen_string_literal: true

module Bundesliga
  class Matchday
    class Match
      attr_reader :home_team, :away_team, :score, :kick_off

      def initialize(home_team:, away_team:, score:, kick_off:)
        @home_team = home_team
        @away_team = away_team
        @score = score
        @kick_off = kick_off
      end
    end
  end
end
