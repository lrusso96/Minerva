Feature: Explore / outside
As a LOGGED USER
I want to HAVE A EXPLORE PAGE
so that I can FIND PAPERS “OUTSIDE”

@javascript
Scenario: basic
Given I am a registered user
When I log in
Given I am on explore page
When I fill in "Search" with "querzoni"
And I click search button
Then I should see "Malware"
