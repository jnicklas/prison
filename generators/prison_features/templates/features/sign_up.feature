Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to sign up

  Scenario: User creates an account
    Given I am on the homepage
     When I follow "Sign up"
     Then I should see the header "Sign up"

     When I fill in "Email" with "user@example.com"
      And I fill in "Password" with "password"
      And I fill in "Password Confirmation" with "password"
      And I press "Sign Up"

     Then I should see the header "Sign In"
      And I should see a flash notice
      And "user@example.com" should receive 1 email

  Scenario: User tries to create an account with invalid data and fails
    Given I am on the homepage
     When I follow "Sign up"
     Then I should see the header "Sign up"

     When I fill in "Email" with "user@example.com"
      And I fill in "Password" with "password"
      And I fill in "Password Confirmation" with "wrong"
      And I press "Sign Up"

     Then "user@example.com" should not receive an email
      And I should see form errors
      And I should see the header "Sign up"
      And the "Email" field should contain "user@example.com"

     When I fill in "Email" with "user@example.com"
     When I fill in "Password" with "password"
      And I fill in "Password Confirmation" with "password"
      And I press "Sign up"

     Then I should see the header "Sign In"
      And I should see a flash notice
      And "user@example.com" should receive 1 email

  Scenario: User confirms his account
    Given I signed up with "email@person.com/password"
    When I follow the confirmation link sent to "email@person.com"
    Then I should see "Confirmed email and signed in"
    And I should be signed in

