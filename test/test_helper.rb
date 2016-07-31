$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'hostman'

require 'minitest/spec'
require 'minitest/autorun'

module Fixtures
  HOSTS_CONTENT="127.0.0.1\tlocalhost"

  def Fixtures.mkfixtures
    `mkdir -p test/fixtures`
  end

  class Hosts
    def self.populate filename
      `echo "#{HOSTS_CONTENT}" > test/fixtures/#{filename}`
    end
  end
end

Fixtures.mkfixtures
Fixtures::Hosts.populate "hosts1"
Fixtures::Hosts.populate "hosts2"