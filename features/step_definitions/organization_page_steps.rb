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


  create_inproceedings_reference("Best inproceedings", 2014, 'P. Puska & Co.')
  create_inproceedings_reference("Best inproceedings2", 2014, 'P. Puska & Co.')


end