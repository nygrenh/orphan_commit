begin
  require 'rspec/expectations';
rescue LoadError;
  require 'spec/expectations';
end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

When(/^I go to the page that shows organization's references$/) do
  visit organizations_path
  click_link("Inproceed Org")
end

Given(/^two inproceedings references have been added$/) do
  visit new_inproceedings_path
  fill_in('reference_title', with: 'Best inproceedings')
  fill_in('reference_year', with: '2014')
  fill_in('reference_authors_names', with: 'P. Puska & Co.')
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
  click_button("Create Reference")

  visit new_inproceedings_path
  fill_in('reference_title', with: 'Best inproceedings2')
  fill_in('reference_year', with: '2014')
  fill_in('reference_authors_names', with: 'P. Puska & Co.')
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
  click_button("Create Reference")
end