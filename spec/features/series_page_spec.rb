require 'spec_helper'

describe "Series page" do
  it "should not have any before some are created" do
    visit series_index_path
    expect(page).to have_content 'Listing series'
    expect(page).to have_content 'Number of series: 0'
  end

  describe "when a single series is added" do

    before :each do
      FactoryGirl.create(:series)

      visit series_index_path
    end

    it "shows the correct total number of series" do
      expect(page).to have_content 'Number of series: 1'
    end

    it "shows the correct name of series" do
      expect(page).to have_content 'Random kokoelmat'
    end

  end

  describe "when many series are added" do

    before :each do
      FactoryGirl.create(:series)
      FactoryGirl.create(:series, name: "Kukka")
      FactoryGirl.create(:series, name: "Hattu")

      visit series_index_path
    end

    it "shows the correct total number of series" do
      expect(page).to have_content 'Number of series: 3'
    end

    it "shows the correct name of series" do
      expect(page).to have_content 'Random kokoelmat'
      expect(page).to have_content 'Kukka'
      expect(page).to have_content 'Hattu'
    end

  end




end