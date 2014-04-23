require 'spec_helper'

describe "Organizations page" do
  it "should not have any before some are created" do
    visit organizations_path
    expect(page).to have_content 'Listing organizations'
    expect(page).to have_content 'Number of organizations: 0'
  end

  describe "when a single organization is added" do

    before :each do
      FactoryGirl.create(:organization)

      visit organizations_path
    end

    it "shows the correct total number of organizations" do
      expect(page).to have_content 'Number of organizations: 1'
    end

    it "shows the correct name of organization" do
      expect(page).to have_content 'Random kokoelmat'
    end

  end

  describe "when many organizations are added" do

    before :each do
      FactoryGirl.create(:organization)
      FactoryGirl.create(:organization, name: "Kukka")
      FactoryGirl.create(:organization, name: "Hattu")

      visit organizations_path
    end

    it "shows the correct total number of organizations" do
      expect(page).to have_content 'Number of organizations: 3'
    end

    it "shows the correct name of organization" do
      expect(page).to have_content 'Random kokoelmat'
      expect(page).to have_content 'Kukka'
      expect(page).to have_content 'Hattu'
    end

  end




end