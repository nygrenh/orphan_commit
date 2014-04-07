=begin
# encoding: utf-8
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'article'

Given(/^I am on new article reference page$/) do
  visit new_article_path
end

Given(/^I fill in all the fields with correct input values$/) do
  fill_in('article_author', with: 'Whittington, Keith J.')
  fill_in('article_title', with: 'Infusing active learning into introductory programming courses')
  fill_in('article_journal', with: 'J. Comput. Small Coll.')
  fill_in('article_year', with: '2004')
  fill_in('article_volume', with: '19')
  fill_in('article_number', with: '5')
  fill_in('article_pages', with: '249--259')
  fill_in('article_month', with: '3')
  fill_in('article_note', with: 'IMPORTANT')
  fill_in('article_key', with: 'W04')
end

Given(/^I do not fill in all the fields with correct input values$/) do
  fill_in('article_author', with: 'Whittington, Keith J.')
  fill_in('article_title', with: 'Infusing active learning into introductory programming courses')
  fill_in('article_journal', with: 'J. Comput. Small Coll.')
  fill_in('article_year', with: '2004')
  fill_in('article_volume', with: '-9000')
  fill_in('article_number', with: '5')
  fill_in('article_pages', with: '249--259')
  fill_in('article_month', with: '3')
  fill_in('article_note', with: 'IMPORTANT')
  fill_in('article_key', with: 'W04')
end


When(/^I press "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^page should have message: "(.*?)"$/) do |arg1|
  expect(page).to have_content arg1
end

Then(/^the reference should be in the database$/) do
  expect(Article.count).to eq(1)
end

Then(/^the reference should not be in the database$/) do
  expect(Article.count).to eq(0)
end


=end

# encoding: utf-8
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


