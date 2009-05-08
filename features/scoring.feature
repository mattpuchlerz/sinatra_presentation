Feature: scoring a game
  In order to see how well I've done
  As a bowler
  I want get the score of the game

  Scenario Outline: scoring
    Given I have rolled <rolls>
    When the game is over
    Then the score should be <score>
    
  Scenarios:
  | rolls                                                 | score |
  | 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      | 0     |
  | 1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1      | 20    |
  | 2,2, 2,2, 2,2, 2,2, 2,2, 2,2, 2,2, 2,2, 2,2, 2,2      | 40    |
  | 5,5, 1,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      | 12    |
  | 10,  1,1, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0,0      | 14    |
  | 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5, 5,5,5    | 150   |
  | 10,  10,  10,  10,  10,  10,  10,  10,  10,  10,10,10 | 300   |
  
