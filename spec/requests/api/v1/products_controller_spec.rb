require 'rails_helper'

RSpec.describe "::Api::V1::ProductsControllers", type: :request do
  context "GET /index" do
    before(:each) do
      FactoryBot.create(:user)

      5.times do
        FactoryBot.create(:product)
      end
    end

    it 'returns all products' do
      get '/api/v1/products'
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  context 'GET /show' do
    before do
      FactoryBot.create(:user)

      5.times do
        FactoryBot.create(:product)
      end
    end

    it 'returns and show a product' do
      id = Product.all.pluck(:id).sample
      product = Product.find(id)
      get "/api/v1/products/#{id}"
      expect(JSON.parse(response.body)['id']).to eq(id)
    end
  end

  context 'POST /create' do
    before do
      FactoryBot.create(:user)

      3.times do
        FactoryBot.create(:product)
      end
    end

    it 'add 1 product' do
      post "/api/v1/products", params: { name: Faker::Name.name , user_id:  User.first.id, category:  Faker::Name.name , price:  rand(2000...10000) , image:  fixture_file_upload("public/sepeda.jpg", "image/jpeg"), is_active:  false}
      expect(status).to eq(200)
      expect(Product.all.size).to eq(4)
    end
  end

  context 'POST /create' do
    before do
      FactoryBot.create(:user)

      3.times do
        FactoryBot.create(:product)
      end
    end

    it 'add 1 product' do
      post "/api/v1/products", params: { name: Faker::Name.name , user_id:  User.first.id, category:  Faker::Name.name , price:  rand(2000...10000) , image:  fixture_file_upload("public/sepeda.jpg", "image/jpeg"), is_active:  false}
      expect(status).to eq(200)
      expect(Product.all.size).to eq(4)
    end
  end

  context 'PATCH /update' do
    before do
      FactoryBot.create(:user)

      3.times do
        FactoryBot.create(:product)
      end
    end

    it 'change 1 product' do
      binding.pry
      id = Product.all.pluck(:id).sample
      product = Product.find(id)
      patch "/api/v1/products/#{id}", params: { name: Faker::Name.name , user_id:  User.first.id, category:  Faker::Name.name , price:  rand(2000...10000) , image:  fixture_file_upload("public/sepeda.jpg", "image/jpeg")}
      binding.pry
      expect(status).to eq(200)
      expect(Product.all.size).to eq(3)
    end
  end

  context 'DESTROY' do
    before do
      FactoryBot.create(:user)

      5.times do
        FactoryBot.create(:product)
      end
    end

    it 'delete 1 product' do
      id = Product.all.pluck(:id).sample
      product = Product.find(id)
      delete "/api/v1/products/#{id}"
      expect(status).to eq(200)
      expect(Product.all.size).to eq(4)
    end
  end
end
