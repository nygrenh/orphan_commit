require 'spec_helper'

describe "Authors page" do
  it "should not have any before some are created" do
    visit authors_path
    expect(page).to have_content 'Listing authors'
    expect(page).to have_content 'Number of authors: 0'
  end

  describe "when a single author is added" do

    before :each do
      FactoryGirl.create(:author)

      visit authors_path
    end

    it "shows the correct total number of authors" do
      expect(page).to have_content 'Number of authors: 1'
    end

    it "shows the correct name of author" do
      expect(page).to have_content 'Pekka'
    end

  end

  describe "when many authors are added" do

    before :each do
      FactoryGirl.create(:author)
      FactoryGirl.create(:author, name: "Kukka")
      FactoryGirl.create(:author, name: "Hattu")

      visit authors_path
    end

    it "shows the correct total number of authors" do
      expect(page).to have_content 'Number of authors: 3'
    end

    it "shows the correct name of author" do
      expect(page).to have_content 'Pekka'
      expect(page).to have_content 'Kukka'
      expect(page).to have_content 'Hattu'
    end

  end




end