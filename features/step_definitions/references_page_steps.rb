# encoding: utf-8
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'article'
require 'factory_girl'

Given(/^references titled "How to asd", "Intro to Intros", and "Ruby on Rails basics" have been added$/) do
  FactoryGirl.create(:reference_article)
  FactoryGirl.create(:reference_article2)
  FactoryGirl.create(:reference_article3)
end

Given(/^references with authors "Asd Asdington", "Herlock Sholmes", and "David Heinemeier Hansson" have been added$/) do
  ref1 = FactoryGirl.create(:reference_article)
  ref2 = FactoryGirl.create(:reference_article2)
  ref3 = FactoryGirl.create(:reference_article3)
  auth2 = FactoryGirl.create(:author2)
  auth3 = FactoryGirl.create(:author3)
  auth4 = FactoryGirl.create(:author4)
  FactoryGirl.create(:reference_author, author_id: auth4.id, reference_id: ref1.id)
  FactoryGirl.create(:reference_author, author_id: auth3.id, reference_id: ref2.id)
  FactoryGirl.create(:reference_author, author_id: auth2.id, reference_id: ref3.id)
end

Given(/^references published in 2004, 1993, and 2005 have been added$/) do
  FactoryGirl.create(:reference_article)
  FactoryGirl.create(:reference_article2)
  FactoryGirl.create(:reference_article3)
end

Given(/^no references have been added$/) do

end

When(/^I go to the page that lists all the references$/) do
  visit references_path
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