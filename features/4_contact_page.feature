Feature: Contact page
As a USER
I want to SEE CONTACT PAGE
so that I can CONTACT DEVELOPERS

Scenario: Visit contact page
Given I am on homepage
When I follow "Contact"
Then I should be on contact page
