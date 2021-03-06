require 'spec_helper'

RSpec.describe ParamsHelper do
  include ParamsHelper

  describe '#path_for' do
    let(:path)  { '/path' }
    let(:query)  { { param: 'value' } }

    subject { path_for(path, query) }

    it 'build URI with path and query' do
      expect(subject).to eq '/path?param=value'
    end
  end

  describe '#self_link' do
    let(:params_helper) { Class.new { include ParamsHelper }.new }

    subject { params_helper.self_link }

    before do
      allow(params_helper).to receive(:request)  { double(base_url: 'http://host', path_info: '/products', params: { product_id: '1' }) }
      allow(params_helper).to receive(:declared).and_return(product_id: '1')
    end

    it { is_expected.to eq 'http://host/products?product_id=1' }
  end
end
