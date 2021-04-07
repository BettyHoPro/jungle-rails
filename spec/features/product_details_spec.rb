require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "Go To Detailed page" do
    visit root_path

    find('.product').hover.find_link('Details').click
    
    expect(page).to have_css 'section.products-show'
    expect(page).to have_content("10")
    save_screenshot
    puts page.html
  end

end
