require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do

    let(:cname) {'tools'}
    let(:category) {Category.new(name: cname)}

    let(:pname) {'power wrench'}
    let(:description) {'Best wrench there is!'}
    let(:price_cents) {1000}
    let(:quantity) {2}
    let(:product) {Product.new(name: pname, description: description, price_cents: price_cents, quantity: quantity, category: category)}

    context 'when all the proper attributes are provided' do
      it 'should be valid' do
        product.valid?
        expect(product).to be_valid
    # validation tests/examples here
      end
    end

    context 'when product name is not present' do

      it 'should not be valid' do
        product.name = nil
        expect(product).to_not be_valid
      end

      it 'reports a validation error on the name' do
        product.name = nil
        product.valid?
        expect(product.errors.full_messages).to include("Name can't be blank")
      end

    end

    context 'when product price is not present' do

      it 'should not be valid' do
        product.price_cents = nil
        expect(product).to_not be_valid
      end

      it 'reports a validation error on the price' do
        product.price_cents = nil
        product.valid?
        expect(product.errors.full_messages).to include("Price can't be blank")
      end

    end


    context 'when product quantity is not present' do

      it 'should not be valid' do
        product.quantity = nil
        expect(product).to_not be_valid
      end

      it 'reports a validation error on the quantity' do
        product.quantity = nil
        product.valid?
        expect(product.errors.full_messages).to include("Quantity can't be blank")
      end

    end

    context 'when product category is not present' do

      it 'should not be valid' do
        product.category = nil
        expect(product).to_not be_valid
      end

      it 'reports a validation error on the category' do
        product.category = nil
        product.valid?
        expect(product.errors.full_messages).to include("Category can't be blank")
      end

    end


  end
end
