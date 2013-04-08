Feature: JUnit output formatter
  In order for developers to create JUnit style test results
  Cucumber should be able to output JUnit xml files
  For details see https://github.com/cucumber/cucumber/issues/124

  Background:
    Given I am in junit
    And the tmp directory is empty


  Scenario: Expand scenario outline into one passing and one failing scenario
    When I run cucumber --format junit --expand --out tmp/ features/scenario_outline.feature
    Then it should fail with
      """

      """
    And "fixtures/junit/tmp/TEST-features-scenario_outline.xml" with junit duration "0.005" should contain
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <testsuite errors="0" failures="1" name="Scenario outlines" skipped="0" tests="2" time="0.005">
    <testcase classname="Scenario outlines" name="| failing | (outline example : | passing |)" time="0.005">
      <system-out/>
      <system-err/>
    </testcase>
    <testcase classname="Scenario outlines" name="| failing | (outline example : | failing |)" time="0.005">
      <failure message="failed | failing | (outline example : | failing |)" type="failed">
        <![CDATA[Scenario: | failing |

    Example row: | failing |

    Message:
    ]]>
        <![CDATA[ (RuntimeError)
    features/scenario_outline.feature:4:in `Given a <type> scenario']]>
      </failure>
      <system-out/>
      <system-err/>
    </testcase>
      <system-out>
        <![CDATA[]]>
      </system-out>
      <system-err>
        <![CDATA[]]>
      </system-err>
    </testsuite>

    """
