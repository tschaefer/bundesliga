# frozen_string_literal: true

require 'bundesliga/app/base'

module Bundesliga
  module App
    class StandingsCommand < Bundesliga::App::BaseCommand
      option %w[-l --league], 'LEAGUE', 'select league', default: '1.Bundesliga'

      def execute
        short = check_league(league)
        begin
          standings = Bundesliga.standings(league: short)
        rescue StandardError => e
          bailout!(e.message)
        end

        puts info(standings)
        puts
        puts table(standings)
      end

      private

      def info(standings)
        Pastel.new.bold("#{standings.info.league}, #{standings.info.matchday}")
      end

      def table(standings) # rubocop:disable Metrics/AbcSize
        rows = []
        standings.teams.each_with_index do |team, idx|
          rows << [
            idx + 1,
            team.name,
            team.matches,
            team.won,
            team.draw,
            team.lost,
            team.points,
            team.goal_diff
          ]
        end
        header = [
          Pastel.new.bold('Pos'),
          Pastel.new.bold('Team'),
          Pastel.new.bold('M'),
          Pastel.new.bold('W'),
          Pastel.new.bold('D'),
          Pastel.new.bold('L'),
          Pastel.new.bold('P'),
          Pastel.new.bold('GD')
        ]

        table = TTY::Table.new(header:, rows:)
        table.render(alignments: %i[right], border_class: TTY::Table::Border::Null)
      end
    end
  end
end
