Feature: Managing Games
  In order to keep track of all games bowled
  As a bowler
  I want to view, add, edit, and delete games

  Scenario: Viewing all games
    Given I am on the games index page
    Then I should see "Games"
      And I should see "New Game"
  
  
  
