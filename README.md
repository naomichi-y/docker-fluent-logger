# DockerFluentLogger

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

Add following code to `app/controllers/application_controller.rb`.

```ruby
class ApplicationController < ActionController::Base
  include DockerFluentLogger::Payload

  rescue_from Exception, with: :render_500 if Rails.env.production?

  def render_500(e = nil)
    append_payload_error(e) if e.present?
  end
end
```

Add following code to `config/environments/***.rb`.

```ruby
if ENV['RAILS_LOG_TO_STDOUT'].present?
  config.logger = DockerFluentLogger.create
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
