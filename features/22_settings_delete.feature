Feature: Settings / Delete account
As a LOGGED USER
I want to HAVE SETTINGS PAGE
so that I can DELETE MY ACCOUNT

Scenario: successfull delete
Given I am a registered user
When I log in
Then I should be on homepage
When I follow "Settings"
Then I should be on settings page
When I press "Delete account"
Then I should be on homepage
Given I am on log in page
When I fill in "Email address" with "cocomero@email.com"
And I fill in "Password" with "foobar"
And I press "Log in"
Then I should not see "Log out"
