Feature: Fugu rules
  In order to expand some text
  A user passes input to fugu
  And gets something useful out
  
  Scenario: Unexpandable text should come back as it went in
    Given the string "web0001"
    When I expand it
    Then I should get back "web0001"
  
  Scenario: Simple expansion
    Given the string "web000{1,2}"
    When I expand it
    Then I should get back "web0001,web0002"
