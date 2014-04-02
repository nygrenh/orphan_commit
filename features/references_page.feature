Feature: References page
  As a user
  I want to see all references on the same page

  Scenario: User can see the titles of the references
    Given references titled "How to asd", "Intro to Intros", and "Ruby on Rails basics" have been added
    When I go to the page that lists all the references
    Then I should see the following
      | How to asd |
      | Intro to Intros |
      | Ruby on Rails basics |
    And the page should have the message "Number of references: 3"

  Scenario: User can see the authors of the references
    Given references with authors "Asd Asdington", "Herlock Sholmes", and "David Heinemeier Hansson" have been added
    When I go to the page that lists all the references
    Then I should see the following
      | Asd Asdington |
      | Herlock Sholmes |
      | David Heinemeier Hansson |

  Scenario: User can see the years of the references
    Given references published in 2004, 1993, and 2005 have been added
    When I go to the page that lists all the references
    Then I should see the following
      | 2004 |
      | 1993 |
      | 2005 |

  Scenario: No references are shown if there are none
    Given no references have been added
    When I go to the page that lists all the references
    Then the page should have the message "Number of references: 0"
