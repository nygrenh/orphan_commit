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
      create_article_reference(2014)

      expect(page).to have_content "Reference was successfully created."
      expect(Reference.count).to eq(1)

    end

    it "user can create a new book reference" do

      create_book_reference(2014)

      expect(page).to have_content "Reference was successfully created."
      expect(Reference.count).to eq(1)
    end

    it "user can create a new inproceedings reference" do

      create_inproceedings_reference(2014)

      expect(page).to have_content "Reference was successfully created."
      expect(Reference.count).to eq(1)
    end

  end

  describe "with wrong parameters given" do

    it "user cannot create a new article reference" do
      create_article_reference(-2586)
      expect(page).to have_content "prohibited this reference from being saved"
      expect(Reference.count).to eq(0)

    end

    it "user cannot create a new book reference" do

     create_book_reference(-2586)

      expect(page).to have_content "prohibited this reference from being saved"
      expect(Reference.count).to eq(0)
    end

    it "user cannot create a new inproceedings reference" do

      create_inproceedings_reference(-2586)

      expect(page).to have_content "prohibited this reference from being saved"
      expect(Reference.count).to eq(0)
    end

  end

  describe "when adding with no paramers" do
    describe "inproceeding" do
      it "gets the right error messages" do 
        visit new_inproceedings_path
        click_button('Create Reference')
        main_expectations
        expect(page).to have_content "Booktitle can't be empty"
      end
    end
    describe "book" do
      it "gets the right error messages" do 
        visit new_book_path
        click_button('Create Reference')
        main_expectations
        expect(page).to have_content "Publisher can't be empty"
      end
    end
    describe "article" do
      it "gets the right error messages" do 
        visit new_article_path
        click_button('Create Reference')
        main_expectations
        expect(page).to have_content "Journal can't be empty"
      end
    end
  end

  it "user can delete a reference" do

    create_inproceedings_reference(2014)


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

      create_inproceedings_reference(2014)
      create_book_reference(2014)
      create_article_reference(2014)

      visit references_path


    end

    it "user can search reference with year" do
      select('year', from:'attribute')
      fill_in('searchtext', with: "2003")
      click_button('Search')

      expect(page).to have_content "Ripan raapustukset"
      expect(page).to have_content "Penan piirrokset2"
      expect(page).to have_content "Pekan kuvakirja"

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
      expect(page).to have_content "Penan piirrokset"
      expect(page).to have_content "Penan piirrokset2"
      expect(page).to have_content "Ripan raapustukset"
      expect(page).to have_content "Ripan raapustukset2"


      expect(page).to have_content "2001"
      expect(page).to have_content "2002"
      expect(page).to have_content "2003"
      expect(page).to have_content "2004"
      expect(page).to have_content "2005"


    end

    it "user can search reference with editor" do
      select('editor', from:'attribute')
      fill_in('searchtext', with: "A. Duck")
      click_button('Search')


     expectations("P. Puska & Co.")


    end

    it "user can search reference with journal" do
      select('journal', from:'attribute')
      fill_in('searchtext', with: "Best Journal")
      click_button('Search')


      expectations("P. Parsa")


    end

    it "user can search reference with publisher" do
      select('publisher', from:'attribute')
      fill_in('searchtext', with: "Best publisher")
      click_button('Search')



      expectations("P. Puska")


    end

    it "user can search reference with series" do
      select('series', from:'attribute')
      fill_in('searchtext', with: "IMPORTANT")
      click_button('Search')



      expectations("P. Puska")


    end

    it "user can search reference with organization" do
      select('organization', from:'attribute')
      fill_in('searchtext', with: "Inproceed Org")
      click_button('Search')



      expectations("P. Puska & Co.")


    end

    it "user can search reference with tag" do
      select('tag', from:'attribute')
      fill_in('searchtext', with: "1TAG")
      click_button('Search')



      expectations("P. Puska & Co.")


    end

    it "user can search reference with reference type" do
      select('reference type', from:'attribute')
      fill_in('searchtext', with: "Book")
      click_button('Search')


      expect(page).to have_content "Pekan kuvakirja"
      expect(page).to have_content "Best book"
      expect(page).to have_content "Penan piirrokset2"
      expect(page).to have_content "Ripan raapustukset2"

    end

    it "user can search reference with booktitle" do
      select('booktitle', from:'attribute')
      fill_in('searchtext', with: "Best book")
      click_button('Search')



      expectations("P. Puska & Co.")


    end

    it "user can search reference with edition" do
      select('edition', from:'attribute')
      fill_in('searchtext', with: "2.")
      click_button('Search')



      expectations("P. Puska")


    end

    it "user can search reference with adress" do
      select('address', from:'attribute')
      fill_in('searchtext', with: "Main Street 5")
      click_button('Search')



      expectations("P. Puska & Co.")


    end

    it "user can search reference with key" do
      select('key', from:'attribute')
      fill_in('searchtext', with: "1245khhj")
      click_button('Search')



      expectations("P. Puska & Co.")


    end

    it "user can search reference with note" do
      select('note', from:'attribute')
      fill_in('searchtext', with: "Remember this")
      click_button('Search')



      expectations("P. Puska & Co.")


    end

    it "user can search reference with month" do
      select('month', from:'attribute')
      fill_in('searchtext', with: "5")
      click_button('Search')



      expectations("P. Puska & Co.")


    end

    it "user can search reference with pages" do
      select('pages', from:'attribute')
      fill_in('searchtext', with: "125--5873")
      click_button('Search')



      expectations("P. Puska & Co.")


    end

    it "user can search reference with number" do
      select('number', from:'attribute')
      fill_in('searchtext', with: "3")
      click_button('Search')



      expectations("P. Puska & Co.")


    end

    it "user can search reference with volume" do
      select('volume', from:'attribute')
      fill_in('searchtext', with: "250")
      click_button('Search')



      expectations("P. Puska & Co.")


    end




  end



end

def expectations(name)
  expect(page).to have_content name
  expect(page).not_to have_content "Pekan kuvakirja"
  expect(page).not_to have_content "Penan piirrokset"
  expect(page).not_to have_content "Penan piirrokset2"
  expect(page).not_to have_content "Ripan raapustukset"
  expect(page).not_to have_content "Ripan raapustukset2"

  expect(page).to have_content "2014"
  expect(page).not_to have_content "2001"
  expect(page).not_to have_content "2002"
  expect(page).not_to have_content "2003"
  expect(page).not_to have_content "2004"
  expect(page).not_to have_content "2005"
end



def create_inproceedings_reference(year)

  visit new_inproceedings_path

  fill_in('reference_title', with: 'Best inproceedings')
  fill_in('reference_year', with: year)
  fill_in('reference_authors_names', with: 'P. Puska & Co.')
  fill_in('reference_booktitle', with: 'Best book')
  fill_in('reference_editors_names', with: 'A. Duck')
  fill_in('reference_series', with: '3.')
  fill_in('reference_volume', with: '250')
  fill_in('reference_number', with: '3')
  fill_in('reference_pages', with: '125--5873')
  fill_in('reference_month', with: '5')
  fill_in('reference_note', with: 'Remember this')
  fill_in('reference_organization', with: 'Inproceed Org')
  fill_in('reference_publisher_name', with: 'Publisher first')
  fill_in('reference_address', with: 'Main Street 5')
  fill_in('reference_key', with: '1245khhj')
  fill_in('reference_tags', with: '1TAG')

  click_button('Create Reference')
end

def create_book_reference(year)

  visit new_book_path

  fill_in('reference_title', with: 'Best book')
  fill_in('reference_year', with: year)
  fill_in('reference_authors_names', with: 'P. Puska')
  fill_in('reference_publisher_name', with: 'Best publisher')
  fill_in('reference_editors_names', with: 'A. Duck')
  fill_in('reference_edition', with: '2.')
  fill_in('reference_volume', with: '250')
  fill_in('reference_number', with: '3')
  fill_in('reference_series', with: 'IMPORTANT')
  fill_in('reference_month', with: '5')
  fill_in('reference_note', with: 'Remember this')
  fill_in('reference_address', with: 'Main Street 3')
  fill_in('reference_key', with: 'XTY567')

  click_button('Create Reference')
end

def create_article_reference(year)
  visit new_article_path

  fill_in('reference_title', with: 'Best article')
  fill_in('reference_year', with: year)
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


end

def main_expectations
  expect(page).to have_content "Title can't be empty"
  expect(page).to have_content "Authors can't be empty"
  expect(page).to have_content "Year can't be empty"
end

