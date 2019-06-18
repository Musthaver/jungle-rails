require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "ProductDetails", type: :feature, js: true do
 
  before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end

  scenario "when clicking on a product header" do
    visit root_path
    find(:css, '.product:first-child header a').click
    expect(page).to have_text('Reviews')
    save_screenshot('single_product.png')
  end
  scenario "when clicking on a product details" do
    visit root_path
    find(:css, '.product:first-child footer a').click
    expect(page).to have_text('Reviews')
    save_screenshot('single_product1.png')
  end


end
