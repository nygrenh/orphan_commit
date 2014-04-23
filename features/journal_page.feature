Feature: Journal page
  As a user
  I want to see all references of one journal on the same page

  Scenario: User can see one reference when visiting journal page
    Given article reference has been added
    When I go to the page that shows journal's references
    Then I should see the following contents
      | Best Journal |
      | References: |
      | Reference Type |
      | Title |
      | Authors |
      | Year|
      | Article |
      | Best article |
      | P. Parsa |
      | 2014|




  Scenario: User can see many references when journal has many
    Given two article references have been added
    When I go to the page that shows journal's references
    Then I should see the following contents
      | Best Journal |
      | References: |
      | Reference Type |
      | Title |
      | Authors |
      | Year|
      | Article |
      | Best article |
      | P. Parsa |
      | 2014|
      | Article |
      | Best article2 |
      | P. Parsa |
      | 2014 |



