Feature: Profile / Country flag
As a LOGGED USER
I want to HAVE A PROFILE PAGE
so that I can SEE THE FLAG OF MY COUNTRY

Scenario: italian flag
Given I am a registered user
When I log in
Then I should be on homepage
When I follow "Settings"
Then I should be on settings page
When I select "Italy (IT)" from "Country"
And I press "Save changes"
Then I should be on homepage
