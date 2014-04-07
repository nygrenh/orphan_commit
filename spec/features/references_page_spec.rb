require 'spec_helper'

describe "References page" do
  it "should not have any before some are created" do
    visit references_path
    expect(page).to have_content 'Listing references'
    expect(page).to have_content 'Number of references: 0'
  end

  describe "when a single reference is added" do
    before :each do
      FactoryGirl.create(:reference_article)

      visit references_path
    end

    it "shows that references detail" do
      expect(page).to have_content 'Ruby on Rails basics'
    end

    it "shows the correct total number of references" do
      expect(page).to have_content 'Number of references: 1'
    end
  end

  describe "when multiple references are added" do
    before :each do
      @titles = ["Pekan kuvakirja", "Penan piirrokset", "Ripan raapustukset"]
      year = 2001
      @titles.each do |title|
        FactoryGirl.create(:reference_article, title: title, year: year)
        year += 1
      end

      visit references_path
    end

    it "shows the details of those references" do
      @titles.each do |title|
        expect(page).to have_content title
      end
      expect(page).to have_content '2001'
      expect(page).to have_content '2002'
      expect(page).to have_content '2003'
    end

    it "shows the correct total number of references" do
      expect(page).to have_content 'Number of references: 3'
    end
  end

end