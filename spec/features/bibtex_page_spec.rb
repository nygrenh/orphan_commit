require 'spec_helper'

describe "Bibtex page" do


  it "should not have any references in bibtex-form before some references are created" do
    visit bibtex_path
    expect(page).to have_content 'Bibtex for all the references'
    expect(page).to have_content 'Bibtex:'

  end

  describe "when a single article reference is added" do

    before :each do

      create_article_reference("Best article", 2014, "P. Parsa, K. Kukka")

      visit bibtex_path

    end

    it "shows the correct reference in bibtex form" do

      expect(page).to have_content '@Article{'
      expect(page).to have_content 'author = {P. Parsa, K. Kukka},'
      expect(page).to have_content 'journal = {Best Journal},'
      expect(page).to have_content 'title = {Best article},'
      expect(page).to have_content 'year = {2014},'
      expect(page).to have_content 'volume = {54},'
      expect(page).to have_content 'number = {7},'
      expect(page).to have_content 'pages = {250--580},'
      expect(page).to have_content 'month = {3},'
      expect(page).to have_content 'note = {New Note},'
      expect(page).to have_content 'publisher = {Publisher first},'
      expect(page).to have_content 'address = {Main Street 7},'

    end

  end


  describe "when many article references are added" do

    before :each do
      create_article_reference("Best article", 2014, "P. Parsa, K. Kukka")

      create_article_reference("Best article2", 2000, "P. Parsa")

      visit bibtex_path

    end

    it "shows the correct references in bibtex form" do


      expect(page).to have_content '@Article{'
      expect(page).to have_content 'author = {P. Parsa, K. Kukka},'
      expect(page).to have_content 'journal = {Best Journal},'
      expect(page).to have_content 'title = {Best article},'
      expect(page).to have_content 'year = {2014},'
      expect(page).to have_content 'volume = {54},'
      expect(page).to have_content 'number = {7},'
      expect(page).to have_content 'pages = {250--580},'
      expect(page).to have_content 'month = {3},'
      expect(page).to have_content 'note = {New Note},'
      expect(page).to have_content 'publisher = {Publisher first},'
      expect(page).to have_content 'address = {Main Street 7},'

      expect(page).to have_content 'author = {P. Parsa},'
      expect(page).to have_content 'title = {Best article2},'
      expect(page).to have_content 'year = {2000},'


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

    click_button('Create Reference')
  end






end