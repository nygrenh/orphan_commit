Feature: Book reference
  In order to reference books
  As a user
  I want to add a book reference

  Scenario: User can create a reference
    Given I am on new book reference page
    And I fill in all the fields with correct values
    When I press button "Create Reference"
    Then the page should have message: "Reference was successfully created."
    And the reference should be saved in the database

  Scenario: User cannot create a reference
    Given I am on new book reference page
    And I do not fill in all the fields with correct values
    When I press button "Create Reference"
    Then the page should have message: "prohibited this reference from being saved"
    And the reference should not be saved in the database