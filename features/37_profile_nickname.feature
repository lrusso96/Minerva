Feature: Profile / Nickname
As a LOGGED USER
I want to HAVE A PROFILE PAGE
so that I can SEE MY NICKNAME

Scenario: basic
Given I am a registered user
When I log in
Then I should be on homepage
When I follow "Settings"
Then I should be on settings page
When I fill in "Nickname" with "nuovo_nick"
And I press "Save changes"
Then I should be on homepage
When I follow "Profile"
Then I should see "@nuovo_nick"
