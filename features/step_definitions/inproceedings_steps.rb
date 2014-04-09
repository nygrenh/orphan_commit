# encoding: utf-8
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')



Given(/^I am on new inproceedings reference page$/) do
  visit new_inproceedings_path
end

Given(/^I fill in all the fields with the correct values$/) do
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
end

Given(/^I do not fill in all the fields with the correct values$/) do
  fill_in('reference_title', with: 'Best inproceedings')
  fill_in('reference_year', with: '+2014')
  fill_in('reference_authors_names', with: 'P. Puska & Co.')
  fill_in('reference_booktitle', with: 'Best book')
  fill_in('reference_editors_names', with: 'A. Duck')
  fill_in('reference_series', with: '1.')
  fill_in('reference_volume', with: '-250')
  fill_in('reference_number', with: '3')
  fill_in('reference_pages', with: '125--587')
  fill_in('reference_month', with: '45')
  fill_in('reference_note', with: 'Remember this')
  fill_in('reference_organization', with: 'Inproceed Org')
  fill_in('reference_publisher_name', with: 'Publisher first')
  fill_in('reference_address', with: 'Main Street 5')
  fill_in('reference_key', with: '1245khhj')
end


When(/^I press the button "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^the page should have a message: "(.*?)"$/) do |arg1|
  expect(page).to have_content arg1
end

Then(/^the new reference should be saved in the database$/) do
  expect(Reference.count).to eq(1)
end

Then(/^the new reference should not be saved in the database$/) do
  expect(Reference.count).to eq(0)
end


