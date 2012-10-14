Feature: Daring people

  As a user I want to be able to dare other people for fun and profit

  @logged_in
  Scenario: Adding a dare
    Given I am on the startpage
    When I fill in "dare_dared_user_nickname" with "@zeeraw"
    And I fill in "dare_text" with "run stockholm marathon"
    And I submit the form
    Then I should get redirected to the twitter authentication
    And I should see the dare page

