Feature: Log in
As a REGISTERED USER
I want to LOG IN
so that I can JOIN THE SYSTEM

Scenario: Succesfull log in
Given I am a registered user
When I log in
Then I should see "Log out"
