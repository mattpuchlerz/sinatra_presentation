Feature: Managing Games
  In order to keep track of all games bowled
  As a bowler
  I want to view, add, edit, and delete games

  Scenario: Viewing all games
    Given I am on the games index page
    And the following games exist:
      | rolls                                                 |
      | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 10,  1,1, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5,5    |
      | 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,10,10 |
    Then I should see "Games"
    And I should see "New Game"
    And I should see the following:
      | rolls                                                 |
      | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 10,  1,1, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      |
      | 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5,5    |
      | 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,10,10 |
  
  
  
