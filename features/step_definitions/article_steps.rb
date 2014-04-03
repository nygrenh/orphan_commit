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

When(/^I press "(.*?)"$/) do |arg1|
  click_button("Create Article")
end

Then(/^page should have message: "(.*?)"$/) do |arg1|
  expect(page).to have_content 'Article was successfully created.'
end