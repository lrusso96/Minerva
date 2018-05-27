Feature: Home / Feed
As a LOGGED USER
I want to HAVE A HOME PAGE
so that I can SEE MY FOLLOWING’S PAPERS

Scenario: basic
Given I am a registered user
When I log in
Then I should be on homepage
And I should see "Feed"
