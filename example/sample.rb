require 'bundler/setup'
require 'docker-fluent-logger'

logger = DockerFluentLogger.create
logger.info('example');
