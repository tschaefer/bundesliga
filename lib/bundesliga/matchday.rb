# frozen_string_literal: true

require 'active_support/all'

require 'bundesliga/agent'
require 'bundesliga/info'
require 'bundesliga/matchday/match'

module Bundesliga
  class Matchday
    attr_reader :matches, :info

    def initialize(league: 'bl1')
      path = "/getmatchdata/#{league}"

      @agent = Agent.new(path)
      fetch_matchday
    end

    private

    def fetch_matchday
      data = @agent.get

      parse_info(data)
      parse_matches(data)
    end

    def parse_info(data)
      @info = Bundesliga::Info.new(
        league: data.first['leagueName'],
        matchday: data.first['group']['groupName']
      )
    end

    def parse_matches(data)
      @matches = data.map do |match|
        score = '-:-'
        if match['matchResults'].present?
          result = match['matchResults'].find { |r| r['resultName'] == 'Endergebnis' }
          score = "#{result['pointsTeam1']}:#{result['pointsTeam2']}"
        end

        Bundesliga::Matchday::Match.new(
          home_team: match['team1']['teamName'],
          away_team: match['team2']['teamName'],
          score:,
          kick_off: Time.parse(match['matchDateTimeUTC'])
        )
      end
    end
  end
end
