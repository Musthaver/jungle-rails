require 'rails_helper'
require 'support/database_cleaner'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
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

    scenario "when clicking on add button" do
      visit root_path
      find(:css, '.product:first-child footer form button').click
      expect(page).to have_content " My Cart (1)"
      save_screenshot('cart_one.png')
    end
  
end
