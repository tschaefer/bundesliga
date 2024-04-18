# frozen_string_literal: true

require 'active_support/all'
require 'tty-table'

require 'bundesliga/app/base'

module Bundesliga
  module App
    class MatchdayCommand < Bundesliga::App::BaseCommand
      option %w[-l --league], 'LEAGUE', 'select league', default: '1.Bundesliga'

      def execute
        short = check_league(league)
        begin
          matchday = Bundesliga.matchday(league: short)
        rescue StandardError => e
          bailout!(e.message)
        end

        puts info(matchday)
        puts
        puts table(matchday)
      end

      private

      def info(matchday)
        Pastel.new.bold("#{matchday.info.league}, #{matchday.info.matchday}")
      end

      def table(matchday)
        table = TTY::Table.new(matchday.matches.map { |m| [m.home_team, m.score, m.away_team] })
        table.render(alignments: %i[left center right], border_class: TTY::Table::Border::Null)
      end
    end
  end
end
