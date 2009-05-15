Feature: HTML
  In order for the website to render correctly
  As a developer
  I want the required HTML markup to be in the response

  Scenario Outline: Required HTML tags
    Given I am on the home page
    Then I should see the "<tag>" tag
    
    Examples:
    | tag   |
    | html  |
    | head  |
    | title |
    | body  |
