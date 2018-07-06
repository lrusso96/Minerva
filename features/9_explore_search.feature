Feature: Explore / Search
As a LOGGED USER
I want to HAVE A EXPLORE PAGE
so that I can SEARCH PAPERS

@javascript
Scenario: basic
Given I am a registered user
When I log in
And I upload a paper
Given I am on explore page
When I fill in "Search" with "Random"
And I click search button
Then I should see "Random title"
