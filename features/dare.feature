Feature: Daring people

  As a user I want to be able to dare other people for fun and profit

  Scenario: Adding a dare
    Given I am on the startpage
    When I fill in "dare_owner_nickname" with "@zeeraw"
    And I fill in "dare_text" with "run stockholm marathon"
    And I submit the form
    Then I should see the dare page
