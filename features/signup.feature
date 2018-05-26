Feature: Signup
As an UNREGISTERED USER
I want to SIGNUP
so that I can BECOME A USER

Scenario: Unsuccesfull signup due to missing data
Given I am on homepage
When I fill in "Email" with "prova@account.it"
And I fill in "Password" with "password"
And I fill in "Password confirmation" with "password"
And I press "Sign up for Minerva"
Then the "Name" field should have the error "can't be blank"
And the "Surname" field should have the error "can't be blank"

Scenario: Unsuccesfull signup due to wrong data
Given I am on homepage
When I fill in "Email" with "prova@account.it"
And I fill in "Name" with "nome"
And I fill in "Surname" with "cognome"
And I fill in "Birthdate" with "3000/01/01"
And I fill in "Password" with "password"
And I fill in "Password confirmation" with "password"
And I press "Sign up for Minerva"
Then the "Birthdate" field should have the error "must be before"
And I should not see "Log out"

Scenario: Unsuccesfull signup due to existing account/email
Given I am a registered user
When I log in
And I follow "Log out"
Given I am on homepage
When I fill in "Email" with "cocomero@email.com"
And I fill in "Name" with "nome"
And I fill in "Surname" with "cognome"
And I fill in "Birthdate" with "1990/01/01"
And I fill in "Password" with "password"
And I fill in "Password confirmation" with "password"
And I press "Sign up for Minerva"
Then I should not see "Log out"

Scenario: Succesfull signup
Given I am on homepage
When I fill in "Email" with "prova@account.it"
And I fill in "Name" with "nome"
And I fill in "Surname" with "cognome"
And I fill in "Birthdate" with "1990/01/01"
And I fill in "Password" with "password"
And I fill in "Password confirmation" with "password"
And I press "Sign up for Minerva"
Then I should see "Log out"
