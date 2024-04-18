# frozen_string_literal: true

require 'bundesliga/agent'
require 'bundesliga/info'
require 'bundesliga/standings/team'

module Bundesliga
  class Standings
    attr_reader :teams, :info

    def initialize(league: 'bl1')
      season = determine_season
      path = "/getbltable/#{league}/#{season}"

      @agent = Agent.new(path)
      fetch_standings(league, season)
    end

    private

    def determine_season
      Date.today.month < 8 ? Date.today.year - 1 : Date.today.year
    end

    def fetch_standings(league, season)
      data = @agent.get

      parse_info(league, season)
      parse_teams(data)
    end

    def parse_info(league, season)
      @agent.path = '/getavailableleagues'
      data = @agent.get

      info = data.find do |d|
        d['leagueShortcut'] == league && d['leagueSeason'] == season.to_s
      end

      league_name = info['leagueName']

      @agent.path = "/getcurrentgroup/#{league}"
      info = @agent.get
      league_matchday = info['groupName']

      @info = Info.new(
        league: league_name,
        matchday: league_matchday
      )
    end

    def parse_teams(data)
      @teams = data.map do |team|
        Team.new(
          name: team['teamName'],
          matches: team['matches'],
          won: team['won'],
          draw: team['draw'],
          lost: team['lost'],
          goal_diff: team['goalDiff'],
          points: team['points']
        )
      end
    end
  end
end
