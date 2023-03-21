RSpec.describe PopulateProductsService, type: :service do
  subject { described_class.new() }
  
  let(:dummy_produtcs) do
    (1..3).map do |index|
      double(ProductAdapter, id: index, title: Faker::Name.name, description: Faker::Name.name,
        image: Faker::Avatar.image, price: Faker::Number.number(digits: 7),
        rating: Faker::Number.number(digits: 1), stock: Faker::Number.number(digits: 3),
        category: Faker::Name.name,
        external_url: Faker::Internet.url(host: 'faker.com', path: '/produts'))
    end
  end

  let(:faker_produtcs) do
    (1..3).map do |index|
      double(ProductAdapter, id: index, title: Faker::Name.name, description: Faker::Name.name,
        image: Faker::Avatar.image, price: Faker::Number.number(digits: 7),
        rating: Faker::Number.number(digits: 1), stock: Faker::Number.number(digits: 3),
        category: Faker::Name.name,
        external_url: Faker::Internet.url(host: 'faker.com', path: '/produts'))
    end
  end

  before do
    allow(DummyClient).to receive(:get_products).and_return(dummy_produtcs)
    allow(FakeStoreClient).to receive(:get_products).and_return(faker_produtcs)
  end

  describe '#call' do
    context 'when insert values' do
      it 'validates if products was created' do
        expect { subject.call }.to change { Product.count }.by(6)
      end
    end
  end
end
