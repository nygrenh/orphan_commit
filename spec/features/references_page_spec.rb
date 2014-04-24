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

  describe "with right parameters given" do

    it "user can create a new article reference" do
      visit new_article_path

      fill_in('reference_title', with: 'Best article')
      fill_in('reference_year', with: '2014')
      fill_in('reference_journal_name', with: 'Best Journal')
      fill_in('reference_authors_names', with: 'P. Parsa')
      fill_in('reference_volume', with: '54')
      fill_in('reference_number', with: '7')
      fill_in('reference_pages', with: '250--580')
      fill_in('reference_month', with: '3')
      fill_in('reference_note', with: 'New Note')
      fill_in('reference_publisher_name', with: 'Publisher first')
      fill_in('reference_address', with: 'Main Street 7')
      fill_in('reference_key', with: 'fdtgvj863')

      click_button('Create Reference')

      expect(page).to have_content "Reference was successfully created."
      expect(Reference.count).to eq(1)

    end

    it "user can create a new book reference" do

      visit new_book_path

      fill_in('reference_title', with: 'Best book')
      fill_in('reference_year', with: '2014')
      fill_in('reference_authors_names', with: 'P. Puska')
      fill_in('reference_publisher_name', with: 'Best publisher')
      fill_in('reference_editors_names', with: 'A. Duck')
      fill_in('reference_edition', with: '1.')
      fill_in('reference_volume', with: '250')
      fill_in('reference_number', with: '3')
      fill_in('reference_series', with: 'IMPORTANT')
      fill_in('reference_month', with: '5')
      fill_in('reference_note', with: 'Remember this')
      fill_in('reference_address', with: 'Main Street 3')
      fill_in('reference_key', with: 'XTY567')

      click_button('Create Reference')

      expect(page).to have_content "Reference was successfully created."
      expect(Reference.count).to eq(1)
    end

    it "user can create a new inproceedings reference" do

      visit new_inproceedings_path

      fill_in('reference_title', with: 'Best inproceedings')
      fill_in('reference_year', with: '2014')
      fill_in('reference_authors_names', with: 'P. Puska & Co.')
      fill_in('reference_booktitle', with: 'Best book')
      fill_in('reference_editors_names', with: 'A. Duck')
      fill_in('reference_series', with: '1.')
      fill_in('reference_volume', with: '250')
      fill_in('reference_number', with: '3')
      fill_in('reference_pages', with: '125--587')
      fill_in('reference_month', with: '5')
      fill_in('reference_note', with: 'Remember this')
      fill_in('reference_organization', with: 'Inproceed Org')
      fill_in('reference_publisher_name', with: 'Publisher first')
      fill_in('reference_address', with: 'Main Street 5')
      fill_in('reference_key', with: '1245khhj')

      click_button('Create Reference')

      expect(page).to have_content "Reference was successfully created."
      expect(Reference.count).to eq(1)
    end

  end

  describe "with wrong parameters given" do

    it "user cannot create a new article reference" do
      visit new_article_path

      fill_in('reference_title', with: '')
      fill_in('reference_year', with: '-2014')
      fill_in('reference_journal_name', with: 'Best Journal')
      fill_in('reference_authors_names', with: 'P. Parsa')
      fill_in('reference_volume', with: '-54')
      fill_in('reference_number', with: '7')
      fill_in('reference_pages', with: '250--580')
      fill_in('reference_month', with: '3')
      fill_in('reference_note', with: 'New Note')
      fill_in('reference_publisher_name', with: 'Publisher first')
      fill_in('reference_address', with: 'Main Street 7')
      fill_in('reference_key', with: 'fdtgvj863')

      click_button('Create Reference')

      expect(page).to have_content "prohibited this reference from being saved"
      expect(Reference.count).to eq(0)

    end

    it "user cannot create a new book reference" do

      visit new_book_path

      fill_in('reference_title', with: '')
      fill_in('reference_year', with: '-2014')
      fill_in('reference_authors_names', with: 'P. Puska')
      fill_in('reference_publisher_name', with: 'Best publisher')
      fill_in('reference_editors_names', with: 'A. Duck')
      fill_in('reference_edition', with: '1.')
      fill_in('reference_volume', with: '-250')
      fill_in('reference_number', with: '-3')
      fill_in('reference_series', with: 'IMPORTANT')
      fill_in('reference_month', with: '5')
      fill_in('reference_note', with: 'Remember this')
      fill_in('reference_address', with: 'Main Street 3')
      fill_in('reference_key', with: 'XTY567')

      click_button('Create Reference')

      expect(page).to have_content "prohibited this reference from being saved"
      expect(Reference.count).to eq(0)
    end

    it "user cannot create a new inproceedings reference" do

      visit new_inproceedings_path

      fill_in('reference_title', with: '')
      fill_in('reference_year', with: '-2014')
      fill_in('reference_authors_names', with: 'P. Puska & Co.')
      fill_in('reference_booktitle', with: 'Best book')
      fill_in('reference_editors_names', with: 'A. Duck')
      fill_in('reference_series', with: '1.')
      fill_in('reference_volume', with: '-250')
      fill_in('reference_number', with: '3')
      fill_in('reference_pages', with: '125--587')
      fill_in('reference_month', with: '-5')
      fill_in('reference_note', with: 'Remember this')
      fill_in('reference_organization', with: 'Inproceed Org')
      fill_in('reference_publisher_name', with: 'Publisher first')
      fill_in('reference_address', with: 'Main Street 5')
      fill_in('reference_key', with: '1245khhj')

      click_button('Create Reference')

      expect(page).to have_content "prohibited this reference from being saved"
      expect(Reference.count).to eq(0)
    end

  end

  it "user can delete a reference" do

    visit new_inproceedings_path

    fill_in('reference_title', with: 'Best inproceedings')
    fill_in('reference_year', with: '2014')
    fill_in('reference_authors_names', with: 'P. Puska & Co.')
    fill_in('reference_booktitle', with: 'Best book')
    fill_in('reference_editors_names', with: 'A. Duck')
    fill_in('reference_series', with: '1.')
    fill_in('reference_volume', with: '250')
    fill_in('reference_number', with: '3')
    fill_in('reference_pages', with: '125--587')
    fill_in('reference_month', with: '5')
    fill_in('reference_note', with: 'Remember this')
    fill_in('reference_organization', with: 'Inproceed Org')
    fill_in('reference_publisher_name', with: 'Publisher first')
    fill_in('reference_address', with: 'Main Street 5')
    fill_in('reference_key', with: '1245khhj')

    click_button('Create Reference')


    visit references_path

    click_link("Destroy")

    expect(page).not_to have_content "Best inproceedings"
    expect(page).not_to have_content "P. Puska & Co."
    expect(page).not_to have_content "2014"
    expect(Reference.count).to eq(0)
  end

  describe "when many references are added" do
    before :each do
      @titles = ["Pekan kuvakirja", "Penan piirrokset", "Ripan raapustukset"]
      year = 2001
      @titles.each do |title|
        FactoryGirl.create(:reference_article, title: title, year: year)
        year += 1
      end

      @inproceedingstitles = ["Pekan kuvakirja", "Penan piirrokset2", "Ripan raapustukset2"]
      year = 2002
      @inproceedingstitles.each do |title|
        FactoryGirl.create(:reference_inproceedings, title: title, year: year)
        year += 1
      end

      @booktitles = ["Pekan kuvakirja", "Penan piirrokset2", "Ripan raapustukset2"]
      year = 2003
      @booktitles.each do |title|
        FactoryGirl.create(:reference_book, title: title, year: year)
        year += 1
      end

      visit references_path


    end

    it "user can search reference with year" do
      select('year', from:'attribute')
      fill_in('searchtext', with: "2003")
      click_button('Search')

      expect(page).to have_content "Ripan raapustukset"
      expect(page).to have_content "Penan piirrokset2"
      expect(page).to have_content "Pekan kuvakirja"
      expect(page).to have_content "Book"
      expect(page).to have_content "Inproceedings"
      expect(page).to have_content "Article"

      expect(page).not_to have_content "2001"
      expect(page).not_to have_content "2002"
      expect(page).not_to have_content "2004"
      expect(page).not_to have_content "2005"

    end

    it "user can search reference with title" do
      select('title', from:'attribute')
      fill_in('searchtext', with: "Pekan kuvakirja")
      click_button('Search')

      expect(page).not_to have_content "Ripan raapustukset"
      expect(page).not_to have_content "Penan piirrokset2"
      expect(page).to have_content "Pekan kuvakirja"
      expect(page).to have_content "Book"
      expect(page).to have_content "Inproceedings"
      expect(page).to have_content "Article"

      expect(page).to have_content "2001"
      expect(page).to have_content "2002"
      expect(page).to have_content "2003"
      expect(page).not_to have_content "2005"
      expect(page).not_to have_content "2004"

    end

    it "user can search reference with author" do
      select('author', from:'attribute')
      fill_in('searchtext', with: "Pekka")
      click_button('Search')

      expect(page).to have_content "Pekan kuvakirja"

      expect(page).to have_content "2001"


    end

  end

end