# frozen_string_literal: true

# :nodoc:
module Bundesliga
  # :nodoc:
  class Standings
    # :nodoc:
    class Team
      attr_reader :name, :matches, :won, :draw, :lost, :goal_diff, :points

      def initialize(name:, matches:, won:, draw:, lost:, goal_diff:, points:) # rubocop:disable Metrics/ParameterLists
        @draw = draw
        @goal_diff = goal_diff
        @lost = lost
        @matches = matches
        @points = points
        @name = name
        @won = won
      end
    end
  end
end
