require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'can create product' do
    it 'creates product when all validations pass' do
      product = Product.new(name: 'my instrument', description: 'description', category: 'brass')
      expect(product.save).to be true
    end

    it 'shows validation error if name absent' do
      product = Product.new(name: '', description: 'description', category: 'brass')
      expect(product.save).to be false
    end

    it 'shows validation error if description absent' do
      product = Product.new(name: 'instrument name', description: '', category: 'brass')
      expect(product.save).to be false
    end

    it 'shows validation error if category absent' do
      product = Product.new(name: 'instrument name', description: 'description', category: '')
      expect(product.save).to be false
    end

    it 'accepts correct category enums' do
      acceptable_categories = [:brass, :percussion, :strings, :woodwind]

      acceptable_categories.each do |category|
        product = Product.new(name: 'instrument name', description: 'description', category: category)
        expect(product.save).to be true
      end

    end
  end
end
