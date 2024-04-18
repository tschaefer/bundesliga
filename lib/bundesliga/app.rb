# frozen_string_literal: true

require 'bundesliga/app/base'
require 'bundesliga/app/matchday'
require 'bundesliga/app/standings'

module Bundesliga
  module App
    class Command < Bundesliga::App::BaseCommand
      option %w[-a --available-leagues], :flag, 'show available leagues' do
        puts AVAILABLE_LEAGUES.keys.join(', ')
        exit 0
      end

      subcommand 'matchday', 'show current matchday', Bundesliga::App::MatchdayCommand
      subcommand 'standings', 'show current standings', Bundesliga::App::StandingsCommand
    end
  end
end
