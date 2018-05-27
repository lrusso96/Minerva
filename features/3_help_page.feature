Feature: Help page
As a USER
I want to SEE HELP PAGE
so that I can GET TIPS

Scenario: Visit help page
Given I am on homepage
When I follow "Help"
Then I should be on help page
