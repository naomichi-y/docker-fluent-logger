require 'logstash-logger'

require 'docker-fluent-logger/cli'
require 'docker-fluent-logger/payload'
require 'docker-fluent-logger/version'

module DockerFluentLogger
  def self.create
    LogStashLogger.new(type: :stdout)
  end
end
