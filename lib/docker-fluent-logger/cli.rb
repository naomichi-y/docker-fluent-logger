require 'thor'

module DockerFluentLogger
  class CLI < Thor
    desc 'install', 'Setup programs'
    def install
      current_dir = Pathname(File.dirname(__FILE__))

      # lograte.rb
      src_path = current_dir.join('generator', 'templates', 'lograge.rb')
      dest_path = Pathname('config').join('initializers', 'lograge.rb')

      FileUtils.cp(src_path, dest_path)
      puts "create #{dest_path}"
    end
  end
end
