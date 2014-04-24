Feature: Author page
  As a user
  I want to see all references of one author on the same page

  Scenario: User can see references when author is only an author
    Given article reference has been added
    When I go to the page that shows author's references
    Then I should see the following contents
      | P. Parsa |
      | References: |
      | Reference Type |
      | Title |
      | Authors |
      | Year|
      | Article |
      | Best article |
      | P. Parsa |
      | 2014|

    And the page should have message "Person does not have any references as editor!"

  Scenario: User can see references when author is only an editor
    Given inproceedings reference has been added
    When I go to the page that shows author's references
    Then I should see the following contents
      | P. Parsa |
      | References: |
      | Reference Type |
      | Title |
      | Authors |
      | Year|
      | Inproceedings |
      | Best inproceedings |
      | P. Parsa |
      | 2014|

    And the page should have message "Person does not have any references as author!"


  Scenario: User can see many references when author has many
    Given one reference of every type has been added
    When I go to the page that shows author's references
    Then I should see the following contents
      | P. Parsa |
      | References: |
      | Reference Type |
      | Title |
      | Authors |
      | Year|
      | Inproceedings |
      | Best inproceedings |
      | P. Parsa |
      | 2014|
      | Book |
      | Best book |
      | P. Puska |
      | 2014 |
      | Article |
      | Best article|
      | P. Parsa |
      | 2014 |


