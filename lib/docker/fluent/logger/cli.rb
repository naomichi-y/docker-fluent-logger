require 'thor'

module Docker
  module Fluent
    module Logger
      class CLI < Thor
        desc 'install', 'Install setup files'
        def install
          puts 'hello'
        end
      end
    end
  end
end
