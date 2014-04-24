# encoding: utf-8
begin
  require 'rspec/expectations';
rescue LoadError;
  require 'spec/expectations';
end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')



Given(/^book reference has been added$/) do
  create_book_reference('Best book', 2014, 'P. Puska')
end

Given(/^article reference has been added$/) do
  create_article_reference("Best article", 2014, 'P. Parsa')
end

Given(/^inproceedings reference has been added$/) do
  create_inproceedings_reference("Best inproceedings", 2014, 'P. Puska & Co.')
end

Given(/^no references of any form have been added$/) do

end

Given(/^one reference of every type has been added$/) do
  create_inproceedings_reference("Best inproceedings", 2014, 'P. Puska & Co.')

  create_book_reference('Best book', 2014, 'P. Puska')

  create_article_reference("Best article", 2014, 'P. Parsa')
end

When(/^I go to the page that shows bibtex-file$/) do
  visit bibtex_path
end

Then(/^I should see the following contents$/) do |table|
  table.raw.each do |row|
    row.each do |content|
      expect(page).to have_content content
    end
  end
end

Then(/^I should not see the following contents$/) do |table|
  table.raw.each do |row|
    row.each do |content|
      expect(page).not_to have_content content
    end
  end
end

Then(/^the page should have message "(.*?)"$/) do |string|
  expect(page).to have_content string
end
