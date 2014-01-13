require 'spec_helper'

describe "Static pages" do

 describe "Home page" do

 it "should have the title 'Home'" do
	visit '/static_pages/home'
	expect(page).to have_title('Home')
  end
  
  it "should have the content 'Sample App'" do 
    visit '/static_pages/home'
    expect(page).to have_content('Sample App')
  end
 end

 describe "Help page" do
 
  it "should have the title 'Help'" do
	visit '/static_pages/help'
	expect(page).to have_title('Help')
  end
  
  it "should have the content 'Help'" do
   visit '/static_pages/help'
   expect(page).to have_content('Help')

  end
 end
 
 describe "About page" do
  
  it "should have the title 'About US'" do
	visit '/static_pages/about'
	expect(page).to have_title('About US')
  end
  
  it "should have the content 'About'" do
    visit '/static_pages/about'
    expect(page).to have_content('About')
  end
  
  describe "Contact page" do
    
    it "should have title  'Contact US'" do
      visit '/static_pages/contact'
      expect(page).to have_title('Contact US')
    end

    it "should have content 'Contact US'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact US')
    end
  end
 end
end


