require 'spec_helper'

describe "Journals page" do
  it "should not have any before some are created" do
    visit journals_path
    expect(page).to have_content 'Listing journals'
    expect(page).to have_content 'Number of journals: 0'
  end

  describe "when a single journal is added" do

    before :each do
      FactoryGirl.create(:journal)

      visit journals_path
    end

    it "shows the correct total number of journals" do
      expect(page).to have_content 'Number of journals: 1'
    end

    it "shows the correct name of journal" do
      expect(page).to have_content 'Random kokoelmat'
    end

  end

  describe "when many journals are added" do

    before :each do
      FactoryGirl.create(:journal)
      FactoryGirl.create(:journal, name: "Kukka")
      FactoryGirl.create(:journal, name: "Hattu")

      visit journals_path
    end

    it "shows the correct total number of journals" do
      expect(page).to have_content 'Number of journals: 3'
    end

    it "shows the correct name of journal" do
      expect(page).to have_content 'Random kokoelmat'
      expect(page).to have_content 'Kukka'
      expect(page).to have_content 'Hattu'
    end

  end




end