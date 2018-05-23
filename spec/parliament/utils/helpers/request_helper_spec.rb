require 'spec_helper'

RSpec.describe Parliament::Utils::Helpers::RequestHelper, vcr: true do
  it 'is a module' do
    expect(subject).to be_a(Module)
  end

  context '#process_available_letters' do
    let(:request) do
      Parliament::Request::UrlRequest.new(
        base_url:   'http://localhost:3030/api/v1',
        builder:    Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator
      ).person_a_to_z
    end

    let(:processed_letters) { described_class.process_available_letters(request) }

    it 'will make the request' do
      processed_letters
      expect(WebMock).to have_requested(:get, 'http://localhost:3030/api/v1/person_a_to_z')
    end

    it 'will map the letters' do
      expect(processed_letters.class).to eq(Array)
      expect(processed_letters[0]).to eq('B')
      expect(processed_letters[1]).to eq('P')
    end
  end

  context '#filter_response_data' do
    let(:request) do
      Parliament::Request::UrlRequest.new(
        base_url:   'http://localhost:3030/api/v1',
        builder:    Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator
      ).member_current
    end

    let(:person_schema_path) { Parliament::Utils::Helpers::RequestHelper.namespace_uri_schema_path('Person') }
    let(:filtered_response) { described_class.filter_response_data(request, person_schema_path, ::Grom::Node::BLANK) }

    it 'will make the request' do
      filtered_response
      expect(WebMock).to have_requested(:get, 'http://localhost:3030/api/v1/member_current')
    end

    it 'will filter by Person' do
      expect(filtered_response[0][0].type).to eq('https://id.parliament.uk/schema/Person')
    end

    it 'will filter letters' do
      expect(filtered_response[1][0].value).to eq('B')
    end
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
