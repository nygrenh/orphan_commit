require 'spec_helper'

describe "Series show page" do

  let!(:series){FactoryGirl.create(:series)}


  it "should not have any references before some are created" do
    visit series_path(series)
    expect(page).to have_content 'Series does not have any references!'

  end

  describe "when a single inproceedings reference is added" do

    before :each do

      create_inproceedings_reference("Best inproceedings", 2014, "P. Parsa", "E. Kukka")

      visit series_index_path
      click_link("1.")
    end

    it "shows the correct reference" do

      expect(page).to have_content 'Reference Type'
      expect(page).to have_content 'Inproceedings'
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Best inproceedings'
      expect(page).to have_content 'Authors'
      expect(page).to have_content 'P. Parsa'
      expect(page).to have_content 'Year'
      expect(page).to have_content '2014'

    end

    it "shows the correct name of series" do
      expect(page).to have_content '1.'
    end

  end


  describe "when many inproceedings references are added" do

    before :each do
      create_inproceedings_reference("Best inproceedings", 2014, "P. Parsa", "E. Kukka")

      create_inproceedings_reference("Best inproceedings2", 2000, "P. Parsa", "E. Kukka")

      visit series_index_path

      click_link("1.")

    end

    it "shows the correct references" do


      expect(page).to have_content '2000'
      expect(page).to have_content 'Best inproceedings2'
      expect(page).to have_content 'Best inproceedings'

      expect(page).to have_content '2014'

    end
  end

  def create_inproceedings_reference(title, year, author_name, editor_name)

    visit new_inproceedings_path

    fill_in('reference_title', with: title)
    fill_in('reference_year', with: year)
    fill_in('reference_authors_names', with: author_name)
    fill_in('reference_booktitle', with: 'Best book')
    fill_in('reference_editors_names', with: editor_name)
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

  end





end