Feature: Home / My papers
As a LOGGED USER
I want to HAVE A HOME PAGE
so that I can SEE MY PAPERS

Scenario: basic
Given I am a registered user
When I log in
And I upload a paper
Given I am on homepage
Then I should see "My recent papers"
And I should see "Random title"
