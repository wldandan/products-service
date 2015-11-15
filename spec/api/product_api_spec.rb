require 'spec_helper'

describe ProductApi do
  include Rack::Test::Methods

  def app
    ProductApi
  end

  context 'get product information successful' do

    let(:body_hash) { JSON.parse(last_response.body, symbolize_names: true) }

    let(:products) do
      [
        { id: 1, name: 'Docker In Action', price: '59.00', _links: { self: { href: 'http://example.org/products/1' } } },
        { id: 2, name: 'Agile In Action', price: '55.00', _links: { self: { href: 'http://example.org/products/2' } } }
      ]
    end

    describe 'all products' do
      subject { get '/products' }


      it 'returns a link for itself' do
        subject
        expect(body_hash[:_links][:self][:href]).to eq 'http://example.org/products'
      end

      it 'should return product list' do
        subject
        expect(body_hash[:_embedded][:products]).to eq products
      end
    end

    describe 'one product' do
      subject { get '/products/1' }

      it 'should return Docker In Action product' do
        subject
        expect(body_hash[:id]).to eq 1
        expect(body_hash[:name]).to eq 'Docker In Action'
        expect(body_hash[:price]).to eq '59.00'
      end
    end
  end

  context 'get product information unsuccessful' do
    let(:body_hash) { JSON.parse(last_response.body, symbolize_names: true) }

    describe 'have some exceptions' do
      before do
        allow(ProductRepository).to receive(:find).and_raise(StandardError, 'there is some error.')
      end

      subject { get '/products/1' }

      it 'logs error and info' do
        subject
        expect(body_hash[:title]).to eq('there is some error.')
        expect(last_response.headers['Content-Type']).to eq('application/problem+json')
      end
    end
  end
end
