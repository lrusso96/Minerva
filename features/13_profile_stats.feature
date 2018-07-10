Feature: Profile / Stats
As a LOGGED USER
I want to HAVE A PROFILE PAGE
so that I can FIND STATS ABOUT ME

Scenario: basic
Given I am a registered user
When I log in
And I upload a paper
Given I am on homepage
When I follow "Profile"
Then I should see "last time was"
And I should see "You have uploaded 1 paper"
