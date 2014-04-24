# encoding: utf-8
begin
  require 'rspec/expectations';
rescue LoadError;
  require 'spec/expectations';
end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

require 'factory_girl'

Given(/^references titled "How to asd", "Intro to Intros", and "Ruby on Rails basics" have been added$/) do
  auth2 = FactoryGirl.create(:author2)
  auth3 = FactoryGirl.create(:author3)
  auth4 = FactoryGirl.create(:author4)
  FactoryGirl.create(:reference_author, author_id: auth4.id, reference_id: 1)
  FactoryGirl.create(:reference_author, author_id: auth3.id, reference_id: 2)
  FactoryGirl.create(:reference_author, author_id: auth2.id, reference_id: 3)
  ref_article = Reference.create(title: "How to asd", year: 1234, journal: FactoryGirl.create(:journal))
  ref_article = Reference.create(title: "Intro to Intros", year: 1234, journal: FactoryGirl.create(:journal))
  ref_article = Reference.create(title: "Ruby on Rails basics", year: 1234, journal: FactoryGirl.create(:journal))

end

Given(/^references with authors "Asd Asdington", "Herlock Sholmes", and "David Heinemeier Hansson" have been added$/) do
  auth2 = FactoryGirl.create(:author2)
  auth3 = FactoryGirl.create(:author3)
  auth4 = FactoryGirl.create(:author4)
  FactoryGirl.create(:reference_author, author_id: auth2.id, reference_id: 1)
  FactoryGirl.create(:reference_author, author_id: auth3.id, reference_id: 2)
  FactoryGirl.create(:reference_author, author_id: auth4.id, reference_id: 3)
  Reference.create(title: "How to asd", year: 1234, journal: FactoryGirl.create(:journal))
  Reference.create(title: "Intro to Intros", year: 1234, journal: FactoryGirl.create(:journal))
  Reference.create(title: "Ruby on Rails basics", year: 1234, journal: FactoryGirl.create(:journal))
end

Given(/^references published in 2004, 1993, and 2005 have been added$/) do
  auth2 = FactoryGirl.create(:author2)
  auth3 = FactoryGirl.create(:author3)
  auth4 = FactoryGirl.create(:author4)
  FactoryGirl.create(:reference_author, author_id: auth4.id, reference_id: 1)
  FactoryGirl.create(:reference_author, author_id: auth3.id, reference_id: 2)
  FactoryGirl.create(:reference_author, author_id: auth2.id, reference_id: 3)
  Reference.create(title: "How to asd", year: 2004, journal: FactoryGirl.create(:journal))
  Reference.create(title: "Intro to Intros", year: 1993, journal: FactoryGirl.create(:journal))
  Reference.create(title: "Ruby on Rails basics", year: 2005, journal: FactoryGirl.create(:journal))
end

Given(/^no references have been added$/) do

end

Given(/^two references of every type have been added$/) do
  create_inproceedings_reference("InpTitle1", 2003, 'P. Puska & Co.')
  create_inproceedings_reference("InpTitle2", 2004, 'P. Puska & Co.')

  create_book_reference("BookTitle1", 2004, 'P. Puska')
  create_book_reference("BookTitle2", 2005, 'P. Puska')

  create_article_reference("ArticleTitle1", 2003, 'P. Parsa')
  create_article_reference("ArticleTitle2", 2004, 'P. Parsa')

end

When(/^I go to the page that lists all the references$/) do
  visit references_path
end

When(/^I go to the page that lists all the references and search from "(.*?)" with "(.*?)"$/) do |query, value|
  visit references_path
  select(query, from:'attribute')
  fill_in('searchtext', with: value)
  click_button('Search')
end

Then(/^I should see the following$/) do |table|
  table.raw.each do |row|
    row.each do |content|
      expect(page).to have_content content
    end
  end
end

Then(/^the page should have the message "(.*?)"$/) do |string|
  expect(page).to have_content string
end

def create_inproceedings_reference(title, year, author)
  visit new_inproceedings_path
  fill_in('reference_title', with: title)
  fill_in('reference_year', with: year)
  fill_in('reference_authors_names', with: author)
  fill_in('reference_booktitle', with: 'Best book')
  fill_in('reference_editors_names', with: 'P. Parsa')
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
  fill_in('reference_tags', with: 'Testi1, Testi2')
  click_button("Create Reference")
end

def create_book_reference(title, year, author)

  visit new_book_path
  fill_in('reference_title', with: title)
  fill_in('reference_year', with: year)
  fill_in('reference_authors_names', with: author)
  fill_in('reference_publisher_name', with: 'Best publisher')
  fill_in('reference_editors_names', with: 'P. Parsa')
  fill_in('reference_edition', with: '1.')
  fill_in('reference_volume', with: '250')
  fill_in('reference_number', with: '3')
  fill_in('reference_series', with: 'IMPORTANT')
  fill_in('reference_month', with: '5')
  fill_in('reference_note', with: 'Remember this')
  fill_in('reference_address', with: 'Main Street 3')
  fill_in('reference_key', with: 'XTY567')
  fill_in('reference_tags', with: 'Testi1, Testi2')
  click_button("Create Reference")
end

def create_article_reference(title, year, author)
  visit new_article_path
  fill_in('reference_title', with: title)
  fill_in('reference_year', with: year)
  fill_in('reference_journal_name', with: 'Best Journal')
  fill_in('reference_authors_names', with: author)
  fill_in('reference_volume', with: '54')
  fill_in('reference_number', with: '7')
  fill_in('reference_pages', with: '250--580')
  fill_in('reference_month', with: '3')
  fill_in('reference_note', with: 'New Note')
  fill_in('reference_publisher_name', with: 'Publisher first')
  fill_in('reference_address', with: 'Main Street 7')
  fill_in('reference_key', with: 'fdtgvj863')
  fill_in('reference_tags', with: 'Testi1, Testi2')
  click_button("Create Reference")
end