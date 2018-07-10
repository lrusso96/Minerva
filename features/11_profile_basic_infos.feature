Feature: Profile / Infos
As a LOGGED USER
I want to SEE PROFILE PAGE OF OTHER USER
so that I can FIND INFOS ABOUT HIM

Scenario: basic
Given there is a registered user
Given I am a registered user
When I log in
Given I am on users page
When I follow "Altro Cocomero"
Then I should see "Altro Cocomer"
