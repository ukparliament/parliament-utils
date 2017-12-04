require 'spec_helper'

RSpec.describe Parliament::Utils::Helpers::RequestHelper, vcr: true do

  it 'is a module' do
    expect(subject).to be_a(Module)
  end

  context '#namespace_uri' do
    it 'returns the correct request domain' do
      expect(subject.namespace_uri).to eq('https://id.parliament.uk')
    end
  end

  context '#namespace_uri_path' do
    it 'adds a route to the request path' do
      expect(subject.namespace_uri_path('/schema')).to eq('https://id.parliament.uk/schema')
    end
  end

  context '#namespace_uri_schema_path' do
    it 'can set a specific schema path' do
      expect(subject.namespace_uri_schema_path('ParliamentPeriod')).to eq('https://id.parliament.uk/schema/ParliamentPeriod')
    end
  end
end
