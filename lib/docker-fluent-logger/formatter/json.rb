require 'active_support'

module DockerFluentLogger
  module Formatter
    class Json < ActiveSupport::Logger::SimpleFormatter
      def call(severity, timestamp, _progname, message)
        {
          type: severity,
          time: timestamp,
          message: message
        }.to_json + "\n"
      end
    end
  end
end
