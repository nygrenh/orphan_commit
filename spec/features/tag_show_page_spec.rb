require 'spec_helper'

describe "Tag show page" do

  let!(:tag){FactoryGirl.create(:tag)}


  it "should not have any references before some are created" do
    visit tag_path(tag)
    expect(page).to have_content 'Tag does not have any references!'

  end

  describe "when a single article reference is added" do

    before :each do

      create_article_reference("Best article", 2014, "P. Parsa")

      visit tags_path
      click_link("Testi1")
    end

    it "shows the correct reference" do

      expect(page).to have_content 'Reference Type'
      expect(page).to have_content 'Article'
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Best article'
      expect(page).to have_content 'Authors'
      expect(page).to have_content 'P. Parsa'
      expect(page).to have_content 'Year'
      expect(page).to have_content '2014'

    end

    it "shows the correct name of tag" do
      expect(page).to have_content 'Testi1'
    end

  end


  describe "when many article references are added" do

    before :each do
      create_article_reference("Best article", 2014, "P. Parsa")

      create_article_reference("Best article2", 2000, "P. Parsa")

      visit tags_path

      click_link("Testi1")

    end

    it "shows the correct references" do


      expect(page).to have_content '2000'
      expect(page).to have_content 'Best article2'
      expect(page).to have_content 'Best article'

      expect(page).to have_content '2014'

    end
  end

  def create_article_reference(title, year, author_name)

    visit new_article_path

    fill_in('reference_title', with: title)
    fill_in('reference_year', with: year)
    fill_in('reference_journal_name', with: 'Best Journal')
    fill_in('reference_authors_names', with: author_name)
    fill_in('reference_volume', with: '54')
    fill_in('reference_number', with: '7')
    fill_in('reference_pages', with: '250--580')
    fill_in('reference_month', with: '3')
    fill_in('reference_note', with: 'New Note')
    fill_in('reference_publisher_name', with: 'Publisher first')
    fill_in('reference_address', with: 'Main Street 7')
    fill_in('reference_key', with: 'fdtgvj863')
    fill_in('reference_tags', with: 'Testi1, Testi2')

    click_button('Create Reference')
  end






end