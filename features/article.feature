Feature: Article reference
    In order to reference articles
    As a user
    I want to be add an article reference

    Scenario: User can create a reference
        Given I am on new article reference page
        And I fill in all the fields with correct input values
        When I press "Create Article"
        Then page should have message: "Article was successfully created."
