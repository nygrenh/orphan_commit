require 'spec_helper'

describe "Publishers page" do
  it "should not have any before some are created" do
    visit publishers_path
    expect(page).to have_content 'Listing publishers'
    expect(page).to have_content 'Number of publishers: 0'
  end

  describe "when a single publisher is added" do

    before :each do
      FactoryGirl.create(:publisher)

      visit publishers_path
    end

    it "shows the correct total number of publishers" do
      expect(page).to have_content 'Number of publishers: 1'
    end

    it "shows the correct name of publisher" do
      expect(page).to have_content 'Random kokoelmat'
    end

  end

  describe "when many publishers are added" do

    before :each do
      FactoryGirl.create(:publisher)
      FactoryGirl.create(:publisher, name: "Kukka")
      FactoryGirl.create(:publisher, name: "Hattu")

      visit publishers_path
    end

    it "shows the correct total number of publishers" do
      expect(page).to have_content 'Number of publishers: 3'
    end

    it "shows the correct name of publisher" do
      expect(page).to have_content 'Random kokoelmat'
      expect(page).to have_content 'Kukka'
      expect(page).to have_content 'Hattu'
    end

  end




end