Feature: Home / Feed
As a LOGGED USER
I want to HAVE A HOME PAGE
so that I can SEE MY FOLLOWING’S PAPERS

Scenario: follow & unfollow of same user
Given there is a registered user
When He logs in
And He uploads a paper
And He logs out
Given I am a registered user
When I log in
Then I should be on homepage
Given I am on users page
When I follow "Altro Cocomero"
And I follow "Follow"
Given I am on homepage
When I follow "Feed Papers"
Then I should be on homepage
And I should see-js "Nice paper"
Given I am on users page
When I follow "Altro Cocomero"
And I follow "Unfollow"
Given I am on homepage
When I follow "Feed Papers"
Then I should be on homepage
And I should not see-js "Nice paper"
