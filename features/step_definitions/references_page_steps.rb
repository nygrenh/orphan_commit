# encoding: utf-8
begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'article'
require 'factory_girl'

Given(/^references titled "How to asd", "Intro to Intros", and "Ruby on Rails basics" have been added$/) do
  FactoryGirl.create(:article, title:"How to asd", author: "Asd Asdington", year: 2004)
  FactoryGirl.create(:article, title:"Intro to Intros", author: "Herlock Sholmes", year: 1993)
  FactoryGirl.create(:article, title:"Ruby on Rails basics", author: "David Heinemeier Hansson", year: 2005)
end

Given(/^references with authors "Asd Asdington", "Herlock Sholmes", and "David Heinemeier Hansson" have been added$/) do
  FactoryGirl.create(:article, title:"How to asd", author: "Asd Asdington", year: 2004)
  FactoryGirl.create(:article, title:"Intro to Intros", author: "Herlock Sholmes", year: 1993)
  FactoryGirl.create(:article, title:"Ruby on Rails basics", author: "David Heinemeier Hansson", year: 2005)
end

Given(/^references published in 2004, 1993, and 2005 have been added$/) do
  FactoryGirl.create(:article, title:"How to asd", author: "Asd Asdington", year: 2004)
  FactoryGirl.create(:article, title:"Intro to Intros", author: "Herlock Sholmes", year: 1993)
  FactoryGirl.create(:article, title:"Ruby on Rails basics", author: "David Heinemeier Hansson", year: 2005)
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