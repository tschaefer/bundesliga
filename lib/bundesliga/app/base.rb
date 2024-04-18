# frozen_string_literal: true

require 'clamp'
require 'pastel'
require 'tty-pager'

require 'bundesliga'

module Bundesliga
  module App
    class BaseCommand < Clamp::Command
      AVAILABLE_LEAGUES = {
        '1.Bundesliga' => 'bl1',
        '2.Bundesliga' => 'bl2',
        '3.Bundesliga' => 'bl3'
      }.freeze

      option %w[-m --man], :flag, 'show manpage' do
        manpage = <<~MANPAGE
          Name:
            bundesliga - Fussball Bundesliga current matchday and standings

          Description:
            bundesliga is a command line tool to display the current matchday
            and standings records of the German professional football leagues.

          #{help}
          Author:
            Tobias Schäfer <github@blackox.org>

          Copyright and License:
            his software is copyright (c) 2024 by Tobias Schäfer.

            This package is free software; you can redistribute it and/or
            modify it under the terms of the "MIT License"
        MANPAGE
        TTY::Pager.page(manpage)
        exit 0
      end

      option %w[-v --version], :flag, 'show version' do
        puts "bundesliga #{Bundesliga::VERSION}"
        exit 0
      end

      private

      def check_league(league)
        AVAILABLE_LEAGUES[league] || bailout!("Unknown league: #{league}")
      end

      def bailout!(message)
        puts Pastel.new.red.bold(message)
        exit 1
      end
    end
  end
end
