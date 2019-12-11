require 'json'
require 'logger'
require 'oj'

require 'docker-fluent-logger/cli'
require 'docker-fluent-logger/payload'
require 'docker-fluent-logger/version'

module DockerFluentLogger
  def self.create
    logger = Logger.new(STDOUT)

    logger.formatter = proc do |severity, datetime, progname, message|
      data = {
        severity: severity,
        datetime: datetime.iso8601,
        message: message
      }
      data[:progname] = progname unless progname.nil?
      "#{Oj.dump(data, mode: :compat)}\n"
    end

    logger
  end
end
