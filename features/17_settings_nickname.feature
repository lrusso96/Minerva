Feature: Settings / Nickname
As a LOGGED USER
I want to HAVE SETTINGS PAGE
so that I can SET A NICKNAME

Scenario: basic change
Given I am a registered user
When I log in
Then I should be on homepage
When I follow "Settings"
Then I should be on settings page
When I fill in "Nickname" with "nuovo_nick"
And I fill in "Current password" with "foobar"
And I press "Update"
Then I should be on homepage
When I follow "Profile"
Then I should see "@nuovo_nick"
