*** Settings ***
Resource            ../Config/${env}.robot
Resource            ../TestScenario/DanaPensiunTest.robot
Suite Setup         Begin Web Test
Suite Teardown      End Web Test

*** Test Cases ***
verify user can calculate dana pensiun and back to recalculate
    [Documentation]    This scenario for calculate dana pensiun dan hitung ulang
    [Tags]             positive    danapensiun    calculate    recalculate   
    Calculate dana pensiun and recalculate

verify user can calculate dana pensiun and get result
    [Documentation]    This scenario for calculate dana pensiun and get result
    [Tags]             positive    danapensiun    calculate    getresult
    Calculate dana pensiun and get result