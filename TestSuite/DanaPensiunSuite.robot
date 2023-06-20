*** Settings ***
Resource            ../Config/${env}.robot
Resource            ../TestScenario/DanaPensiunTest.robot
Suite Setup         Begin Web Test
Suite Teardown      End Web Test

*** Test Cases ***
verify user can calculate dana pensiun and back to recalculate
    Calculate dana pensiun and recalculate

verify user can calculate dana pensiun and get result
    Calculate dana pensiun and get result