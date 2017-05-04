require 'spec_helper'

RSpec.describe DockerFluentLogger do
  it 'has a version number' do
    expect(DockerFluentLogger::VERSION).not_to be nil
  end
end
