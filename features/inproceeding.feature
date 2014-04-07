Feature: Inproceeding reference
  In order to reference inproceedings
  As a user
  I want to add an inproceeding reference

  Scenario: User can create a reference
    Given I am on new inproceeding reference page
    And I fill in all the fields with the correct values
    When I press the button "Create Reference"
    Then the page should have a message: "Reference was successfully created."
    And the new reference should be saved in the database

  Scenario: User cannot create a reference
    Given I am on new inproceeding reference page
    And I do not fill in all the fields with the correct values
    When I press the button "Create Reference"
    Then the page should have a message: "prohibited this reference from being saved"
    And the new reference should not be saved in the database