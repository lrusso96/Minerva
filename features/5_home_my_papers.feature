Feature: Home / My papers
As a LOGGED USER
I want to HAVE A HOME PAGE
so that I can SEE MY PAPERS

Scenario: basic
Given I am a registered user
When I log in
Then I should be on homepage
And I should see "My recent papers"
