describe ProductRepository, '.list' do

  subject { ProductRepository.list }

  it 'returns all products' do
    expect(subject.length).to eq(2)
  end
end

describe ProductRepository, '.find' do
  subject { ProductRepository.find(1) }

  it 'returns the first product' do
    expect(subject.id).to eq(1)
    expect(subject.name).to eq('Docker In Action')
    expect(subject.price).to eq(59.0)
  end
end
