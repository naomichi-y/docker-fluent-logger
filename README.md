# DockerFluentLogger

Output Rails log to JSON format.

# e.g.

HTTP request outputs following log to STDOUT.

```
{
  "method": "GET",
  "path": "/",
  "format": "html",
  "controller": "IndexController",
  "action": "index",
  "status": 403,
  "duration": 428.27,
  "view": 0.29,
  "db": 0.0,
  "timestamp": "2019-12-11T12:21:00.050200Z",
  "hostname": "f78a33527a16",
  "uuid": "a4ecff04-d6d9-4477-8746-0b78ccae0e13",
  "url": "http://localhost:3000/",
  "remote_ip": "172.29.0.1",
  "referer": null,
  "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36"
}
```

Rails logger also output logs in JSON as well.

```
logger.info('example')

# Or

DockerFluentLogger.create.info('example')
```

```
{
  "severity": "INFO",
  "datetime": "2019-12-11T12:19:01.599089Z",
  "message": "example"
}
```

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
config.logger = DockerFluentLogger.create
```

## License

MIT
