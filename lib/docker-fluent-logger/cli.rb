require 'thor'

module DockerFluentLogger
  class CLI < Thor
    desc 'install', 'Install file'
    def install
      current_dir = Pathname(File.dirname(__FILE__))

      src_path = current_dir.join('generator', 'templates', 'lograge.rb')
      dest_path = Pathname('config').join('initializers', 'lograge.rb')

      FileUtils.cp(src_path, dest_path)
      puts "create #{dest_path}"
    end
  end
end
