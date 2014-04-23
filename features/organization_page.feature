Feature: Organization page
  As a user
  I want to see all references of one organization on the same page

  Scenario: User can see one reference when visiting organization page
    Given inproceedings reference has been added
    When I go to the page that shows organization's references
    Then I should see the following contents
      | Inproceed Org|
      | References: |
      | Reference Type |
      | Title |
      | Authors |
      | Year|
      | Inproceedings |
      | Best inproceedings |
      | P. Puska & Co. |
      | 2014|




  Scenario: User can see many references when organization has many
    Given two inproceedings references have been added
    When I go to the page that shows organization's references
    Then I should see the following contents
      | Inproceed Org |
      | References: |
      | Reference Type |
      | Title |
      | Authors |
      | Year|
      | Inproceedings |
      | Best inproceedings |
      | P. Puska & Co.|
      | 2014|
      | Inproceedings |
      | Best inproceedings2 |
      | P. Puska & Co.|
      | 2014 |



