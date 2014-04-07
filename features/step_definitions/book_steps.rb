# encoding: utf-8
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'article'

Given(/^I am on new book reference page$/) do
  visit new_book_path
end

Given(/^I fill in all the fields with correct values$/) do
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
end

Given(/^I do not fill in all the fields with correct values$/) do
  fill_in('reference_title', with: 'Best book')
  fill_in('reference_year', with: 'XI')
  fill_in('reference_authors_names', with: 'P. Puska')
  fill_in('reference_publisher_name', with: 'Best publisher')
  fill_in('reference_editors_names', with: 'A. Duck')
  fill_in('reference_edition', with: '1.')
  fill_in('reference_volume', with: '-250')
  fill_in('reference_number', with: '3')
  fill_in('reference_series', with: 'IMPORTANT')
  fill_in('reference_month', with: '15')
  fill_in('reference_note', with: 'Remember this')
  fill_in('reference_address', with: 'Main Street 3')
  fill_in('reference_key', with: 'XTY567')
end


When(/^I press button "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^the page should have message: "(.*?)"$/) do |arg1|
  expect(page).to have_content arg1
end

Then(/^the reference should be saved in the database$/) do
  expect(Reference.count).to eq(1)
end

Then(/^the reference should not be saved in the database$/) do
  expect(Reference.count).to eq(0)
end


