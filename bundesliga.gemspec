# frozen_string_literal: true

$LOAD_PATH << File.expand_path('lib', __dir__)
require 'bundesliga/version'

Gem::Specification.new do |spec|
  spec.name        = 'bundesliga'
  spec.version     = Bundesliga::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Tobias Schäfer']
  spec.email       = ['github@blackox.org']

  spec.summary     = 'Fussball Bundesliga current matchday and standings'
  spec.description = <<~DESC
    #{spec.summary}

    This gem provides Fussball Bundesliga current matchday and standings.
    It uses the openligadb.de API to fetch data.

  DESC
  spec.homepage    = 'https://github.com/tschaefer/bundesliga'
  spec.license     = 'MIT'

  spec.files                 = Dir['lib/**/*']
  spec.bindir                = 'bin'
  spec.executables           = ['bundesliga']
  spec.require_paths         = ['lib']
  spec.required_ruby_version = '>= 3.3'

  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.metadata['source_code_uri']       = 'https://github.com/tschaefer/bundesliga'
  spec.metadata['bug_tracker_uri']       = 'https://github.com/tschaefer/bundesliga/issues'

  spec.add_dependency 'activesupport', '~> 7.1.3'
  spec.add_dependency 'clamp', '~> 1.3.2'
  spec.add_dependency 'httparty', '~> 0.21.0'
  spec.add_dependency 'pastel', '~> 0.8.0'
  spec.add_dependency 'tty-pager', '~> 0.14.0'
  spec.add_dependency 'tty-table', '~> 0.12.0'
end
