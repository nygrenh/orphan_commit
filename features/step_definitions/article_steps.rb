begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')



Given(/^I am on new article reference page$/) do
  visit new_article_path
end

Given(/^I fill in all the fields with correct input values$/) do
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
  fill_in('reference_tags', with: 'Testi1, Testi2')

end

Given(/^I do not fill in all the fields with correct input values$/) do
  fill_in('reference_title', with: 'Best article')
  fill_in('reference_year', with: '2014')
  fill_in('reference_journal_name', with: 'Best Journal')
  fill_in('reference_authors_names', with: 'P. Parsa')
  fill_in('reference_volume', with: '54')
  fill_in('reference_number', with: '-7')
  fill_in('reference_pages', with: '250--580')
  fill_in('reference_month', with: '93')
  fill_in('reference_note', with: 'New Note')
  fill_in('reference_publisher_name', with: 'Publisher first')
  fill_in('reference_address', with: 'Main Street 7')
  fill_in('reference_key', with: 'fdtgvj863')
  fill_in('reference_tags', with: 'Testi1, Testi2')
end


When(/^I press "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^page should have message: "(.*?)"$/) do |arg1|
  expect(page).to have_content arg1
end

Then(/^the reference should be in the database$/) do
  expect(Reference.count).to eq(1)
end

Then(/^the reference should not be in the database$/) do
  expect(Reference.count).to eq(0)
end


