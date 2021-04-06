require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "should be valid with valid attribute name" do
      @category = Category.new(name: "Toy")
      @product = Product.new(
        name: "car",
        price: 150,
        quantity: 20,
        category: @category
      )
      expect(@product).to be_valid
    end

    it "should not be valid without a product name" do
      @category = Category.new(name: "Toy")
      @product = Product.new(
        name: nil,
        price: 150,
        quantity: 20,
        category: @category
      )
      expect(@product).to_not be_valid
    end


    it "should not be valid without product price" do
      @category = Category.new(name: "Toy")
      @product = Product.new(
        name: "car",
        price: nil,
        quantity: 20,
        category: @category
      )
      expect(@product).to_not be_valid
    end
    

    it "should not be valid without product quantity" do
      @category = Category.new(name: "Toy")
      @product = Product.new(
        name: "car",
        price: 150,
        quantity: nil,
        category: @category
      )
      expect(@product).to_not be_valid
    end

    it "should not be valid without product category" do
      @category = Category.new(name: "Toy")
      @product = Product.new(
        name: "car",
        price: 150,
        quantity: 20,
        category: nil
      )
      expect(@product).to_not be_valid
    end

  end
end