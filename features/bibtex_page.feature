Feature: Bibtex page
  As a user
  I want to see a bibtex-file on the same page

  Scenario: User can see book-reference in bibtex-form
    Given book reference has been added
    When I go to the page that shows bibtex-file
    Then I should see the following contents
      | @Book{XTY567, |
      | author = {P. Puska}, |
      | title = {Best book}, |
      | year = {2014}, |
      | volume = {250}, |
      | number = {3},|
      | month = {5},|
      | note = {Remember this},|
      | publisher = {Best publisher},|
      | address = {Main Street 3},|
      | series = {IMPORTANT},|
      | }|
    And the page should have message "Bibtex for all the references"

  Scenario: User can see article-reference in bibtex-form
    Given article reference has been added
    When I go to the page that shows bibtex-file
    Then I should see the following contents
      | @Article{fdtgvj863, |
      | author = {P. Parsa}, |
      | journal = {Best Journal}, |
      | title = {Best article}, |
      | year = {2014}, |
      | volume = {54},|
      | number = {7},|
      | pages = {250--580},|
      | month = {3},|
      | note = {New Note},|
      | publisher = {Publisher first},|
      | address = {Main Street 7},|
      | }|
    And the page should have message "Bibtex for all the references"

  Scenario: User can see inproceeding-reference in bibtex-form
    Given inproceeding reference has been added
    When I go to the page that shows bibtex-file
    Then I should see the following contents
      | @Inproceeding{1245khhj,|
      | author = {P. Puska & Co.}, |
      | title = {Best inproceeding}, |
      | year = {2014}, |
      | volume = {250},|
      | number = {3},|
      | pages = {125--587},|
      | month = {5},|
      | note = {Remember this},|
      | publisher = {Publisher first},|
      | address = {Main Street 5},|
      | booktitle = {Best book},|
      | series = {1.},|
      | organization = {Inproceed Org},|
      | }|
    And the page should have message "Bibtex for all the references"

  Scenario: No bibtex-references are shown if there are none
    Given no references of any form have been added
    When I go to the page that shows bibtex-file
    Then I should not see the following contents
      | @Inproceeding{1245khhj,|
      | author = {P. Puska & Co.}, |
      | title = {Best inproceeding}, |
      | year = {2014}, |
      | volume = {250},|
      | number = {3},|
      | pages = {125--587},|
      | month = {5},|
      | note = {Remember this},|
      | publisher = {Publisher first},|
      | address = {Main Street 5},|
      | booktitle = {Best book},|
      | series = {1.},|
      | organization = {Inproceed Org},|
      | }|
      | @Book{XTY567, |
      | author = {P. Puska}, |
      | title = {Best book}, |
      | year = {2014}, |
      | volume = {250}, |
      | number = {3},|
      | month = {5},|
      | note = {Remember this},|
      | publisher = {Best publisher},|
      | address = {Main Street 3},|
      | series = {IMPORTANT},|
      | }|
      | @Article{fdtgvj863, |
      | author = {P. Parsa}, |
      | journal = {Best Journal}, |
      | title = {Best article}, |
      | year = {2014}, |
      | volume = {54},|
      | number = {7},|
      | pages = {250--580},|
      | month = {3},|
      | note = {New Note},|
      | publisher = {Publisher first},|
      | address = {Main Street 7},|
      | }|
    Then the page should have the message "Bibtex for all the references"

  Scenario: All bibtex-references are shown if there are many
    Given one reference of every type has been added
    When I go to the page that shows bibtex-file
    Then I should see the following contents
      | @Inproceeding{1245khhj,|
      | author = {P. Puska & Co.}, |
      | title = {Best inproceeding}, |
      | year = {2014}, |
      | volume = {250},|
      | number = {3},|
      | pages = {125--587},|
      | month = {5},|
      | note = {Remember this},|
      | publisher = {Publisher first},|
      | address = {Main Street 5},|
      | booktitle = {Best book},|
      | series = {1.},|
      | organization = {Inproceed Org},|
      | }|
      | @Inproceeding{1245khhj,|
      | author = {P. Puska & Co.}, |
      | title = {Best inproceeding}, |
      | year = {2014}, |
      | volume = {250},|
      | number = {3},|
      | pages = {125--587},|
      | month = {5},|
      | note = {Remember this},|
      | publisher = {Publisher first},|
      | address = {Main Street 5},|
      | booktitle = {Best book},|
      | series = {1.},|
      | organization = {Inproceed Org},|
      | }|
      | @Article{fdtgvj863, |
      | author = {P. Parsa}, |
      | journal = {Best Journal}, |
      | title = {Best article}, |
      | year = {2014}, |
      | volume = {54},|
      | number = {7},|
      | pages = {250--580},|
      | month = {3},|
      | note = {New Note},|
      | publisher = {Publisher first},|
      | address = {Main Street 7},|
      | }|
    Then the page should have the message "Bibtex for all the references"
