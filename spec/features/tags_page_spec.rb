require 'spec_helper'

describe "Tags page" do
  it "should not have any before some are created" do
    visit tags_path
    expect(page).to have_content 'Listing tags'
    expect(page).to have_content 'Number of tags: 0'
  end

  describe "when a single tag is added" do

    before :each do
      FactoryGirl.create(:tag)

      visit tags_path
    end

    it "shows the correct total number of tags" do
      expect(page).to have_content 'Number of tags: 1'
    end

    it "shows the correct name of tag" do
      expect(page).to have_content 'Random kokoelmat'
    end

  end

  describe "when many tags are added" do

    before :each do
      FactoryGirl.create(:tag)
      FactoryGirl.create(:tag, name: "Kukka")
      FactoryGirl.create(:tag, name: "Hattu")

      visit tags_path
    end

    it "shows the correct total number of tags" do
      expect(page).to have_content 'Number of tags: 3'
    end

    it "shows the correct name of tag" do
      expect(page).to have_content 'Random kokoelmat'
      expect(page).to have_content 'Kukka'
      expect(page).to have_content 'Hattu'
    end

  end




end