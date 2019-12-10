require 'logger'
require 'docker-fluent-logger/cli'
require 'docker-fluent-logger/payload'
require 'docker-fluent-logger/version'

module DockerFluentLogger
  def self.create
    logger = Logger.new(STDOUT)
    logger.formatter = proc do |severity, datetime, progname, message|
      %Q|{"severity": "#{severity}", "datetime": "#{datetime.to_s}", "progname": "#{progname}", "message": "#{message}"}\n|
    end
    logger
  end
end
