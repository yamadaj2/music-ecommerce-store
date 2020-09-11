require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET index' do
    it 'assigns @products' do
      product = Product.new(name: 'instrument name', description: 'description', category: :brass)
      product.save!
      get products_path
      expect(assigns(:products)).to eq([product])
    end

    it 'renders the index template' do
      get products_path
      expect(response).to render_template('index')
    end
  end

  describe 'GET new' do
    it 'renders the product new template' do
      get new_product_path
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    it 'creates a product' do
      post products_path, params: { product: { name: 'name', description: 'description', category: :percussion } }
      expect(response).to redirect_to(assigns(:products))
      follow_redirect!

      expect(response).to render_template(:index)
    end
  end

  describe 'PUT update' do
    it 'updates a product' do
      product = Product.create({ name: 'name', description: 'description', category: :percussion })
      put product_path(product), params: { product: { name: 'edited name', description: 'edited description', category: :strings } }
      expect(response).to redirect_to products_path
      expect(product.reload.name).to eq('edited name')
      expect(product.reload.description).to eq('edited description')
      expect(product.reload.category).to eq('strings')
      follow_redirect!

      expect(response).to render_template(:index)
    end
  end

  describe 'DELETE update' do
    it 'deletes a product' do
      product = Product.create(name: 'name', description: 'description', category: :percussion)
      expect { delete product_path(product) }.to change(Product, :count).by(-1)
    end

  end
end
