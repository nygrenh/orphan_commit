Feature: Tag in reference
  In order to create tag
  As a user
  I want to add an reference with tags

  Scenario: User can create an article reference with tags
    Given I am on new article reference page
    And I fill in all the fields with correct input values
    When I press "Create Reference"
    Then page should have message: "Reference was successfully created."
    Then I should see the following contents
      | Key: fdtgvj863 |
      | Authors: P. Parsa |
      | Title: Best article |
      | Journal: Best Journal |
      | Volume: 54 |
      | Number: 7 |
      | Year: 2014 |
      | Pages: 250--580 |
      | Month: 3 |
      | Note: New Note |
      | Publisher: Publisher first |
      | Address: Main Street 7 |
      | Tags: Testi1, Testi2 |
    And the reference should be in the database

  Scenario: User can create an inproceedings reference with tags
    Given I am on new inproceedings reference page
    And I fill in all the fields with the correct values
    When I press "Create Reference"
    Then page should have message: "Reference was successfully created."
    Then I should see the following contents
      | Key: 1245khhj |
      | Authors: P. Puska & Co. |
      | Editor: A. Duck |
      | Title: Best inproceedings |
      | Volume: 250 |
      | Number: 3 |
      | Booktitle: Best book |
      | Series: 1. |
      | Year: 2014 |
      | Pages: 125--587 |
      | Month: 5 |
      | Note: Remember this |
      | Publisher: Publisher first |
      | Organization: Inproceed Org |
      | Address: Main Street 5 |
      | Tags: Testi1, Testi2 |
    And the reference should be in the database

  Scenario: User can create a book reference with tags
    Given I am on new book reference page
    And I fill in all the fields with correct values
    When I press "Create Reference"
    Then page should have message: "Reference was successfully created."
    Then I should see the following contents
      | Key: XTY567 |
      | Authors: P. Puska |
      | Editor: A. Duck |
      | Title: Best book |
      | Volume: 250 |
      | Number: 3 |
      | Series: IMPORTANT |
      | Year: 2014 |
      | Month: 5 |
      | Note: Remember this |
      | Publisher: Best publisher |
      | Address: Main Street 3 |
      | Tags: Testi1, Testi2 |
    And the reference should be in the database

