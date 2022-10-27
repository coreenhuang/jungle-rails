require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    context "given valid inputs" do
      it "validates the entry" do
        @category = Category.new(id: 3, name: "new_category")
        @product = Product.new(name: "product_name", price_cents: 3600, quantity: 9, category: @category)
        expect(@product).to be_valid
      end
    end

    context "given nil for the name input" do
      it "should fail validation" do
        @category = Category.new(id: 3, name: "new_category")
        @product = Product.new(name: "", price_cents: 3600, quantity: 9, category: @category)
        expect(@product).to_not be_valid
      end
    end

    context "given nil for the price input" do
      it "should fail validation" do
        @category = Category.new(id: 3, name: "new_category")
        @product = Product.new(name: "name", price_cents: "", quantity: 9, category: @category)
        expect(@product).to_not be_valid
      end
    end

    context "given nil for the quantity input" do
      it "should fail validation" do
        @category = Category.new(id: 3, name: "new_category")
        @product = Product.new(name: "name", price_cents: 8900, quantity: "", category: @category)
        expect(@product).to_not be_valid
      end
    end

    context "given nil for the category input" do
      it "should fail validation" do
        @category = Category.new(id: 3, name: "new_category")
        @product = Product.new(name: "name", price_cents: 8900, quantity: 10, category: nil)
        expect(@product).to_not be_valid
      end
    end
  end
end
