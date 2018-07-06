Feature: Explore / Recent papers
As a LOGGED USER
I want to HAVE A EXPLORE PAGE
so that I can SEE MOST RECENT PAPERS

Scenario: basic
Given I am a registered user
When I log in
And I upload a paper
Given I am on explore page
Then I should see "Recent papers"
And I should see "Random title"
