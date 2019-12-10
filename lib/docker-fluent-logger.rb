require 'logger'
require 'json'
require 'docker-fluent-logger/cli'
require 'docker-fluent-logger/payload'
require 'docker-fluent-logger/version'

module DockerFluentLogger
  def self.create
    logger = Logger.new(STDOUT)
    logger.formatter = proc do |severity, datetime, progname, message|
      data = {
        severity: severity,
        datetime: datetime,
        message: message
      }
      data["progname"] = progname unless progname.nil?
      data.to_json
    end
    logger
  end
end
