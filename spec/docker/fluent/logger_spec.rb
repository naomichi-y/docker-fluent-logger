require 'spec_helper'

RSpec.describe Docker::Fluent::Logger do
  it 'has a version number' do
    expect(Docker::Fluent::Logger::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
