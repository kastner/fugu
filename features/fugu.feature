Feature: Fugu rules
  In order to expand some text
  A user passes input to fugu
  And gets something useful out
  
  Scenario: Unexpandable text should come back as it went in
    Given the string "web0001"
    When I expand it
    Then I should get back "web0001"

  Scenario: Unexpandable Fugu expression comes back as it went in
    Given the string "web{0001}"
    When I expand it
    Then I should get back "web0001"
  
  Scenario: Simple expansion
    Given the string "web000{1,2}"
    When I expand it
    Then I should get back "web0001,web0002"

  Scenario: Range expanstion
    Given the string "web000{1-3}"
    When I expand it
    Then I should get back "web0001,web0002,web0003"

  Scenario: Mix of simple and complex ranges
    Given the string "web000{1,2-4,6}"
    When I expand it
    Then I should get back "web0001,web0002,web0003,web0004,web0006"
