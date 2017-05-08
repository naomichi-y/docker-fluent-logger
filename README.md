# DockerFluentLogger

@TODO

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'docker-fluent-logger'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install docker-fluent-logger
```

## Setup

Execute following command in root directory of application.
```
$ bundle exec docker-fluent-logger install
create config/initializers/lograge.rb
```

Add following code to `app/controller/application_controller.rb`.

```ruby
def append_info_to_payload(payload)
  super

  payload[:uuid] = request.uuid
  payload[:url] = request.url
  payload[:referer]  = request.referer
  payload[:remote_ip] = request.remote_ip
  payload[:user_agent] = request.user_agent
end
```

Add following code to `config/environments/***.rb`.

```ruby
require 'logstash-logger'

if ENV['RAILS_LOG_TO_STDOUT'].present?
  logger           = LogStashLogger.new(type: :stdout)
  logger.formatter = config.log_formatter
  config.logger = ActiveSupport::TaggedLogging.new(logger)
end
```

When using [ECS Deployer](https://github.com/naomichi-y/ecs_deployer), Add `RAILS_LOG_TO_STDOUT` variable to `config/deploy/***.yml`.

```yaml
environment:
  - name: RAILS_LOG_TO_STDOUT
    value: enabled
```

## License

MIT
