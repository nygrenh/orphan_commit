Feature: Article reference
    In order to reference articles
    As a user
    I want to add an article reference

    Scenario: User can create a reference
        Given I am on new article reference page
        And I fill in all the fields with correct input values
        When I press "Create Article"
        Then page should have message: "Article was successfully created."
        And the reference should be in the database

    Scenario: User cannot create a reference
        Given I am on new article reference page
        And I do not fill in all the fields with correct input values
        When I press "Create Article"
        Then page should have message: "prohibited this article from being saved"
        And the reference should not be in the database