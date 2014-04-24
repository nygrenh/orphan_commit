Feature: Tag page
  As a user
  I want to see all references of one tag on the same page

  Scenario: User can see one reference when visiting tag page
    Given article reference has been added
    When I go to the page that shows tag's references
    Then I should see the following contents
      | Testi1 |
      | References: |
      | Reference Type |
      | Title |
      | Authors |
      | Year|
      | Article |
      | Best article |
      | P. Parsa |
      | 2014|




  Scenario: User can see many references when tag has many
    Given two article references have been added
    When I go to the page that shows tag's references
    Then I should see the following contents
      | Testi1 |
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



