*** Settings ***
Resource            ../Config/${env}.robot
Resource            ../TestScenario/DanaPensiunTest.robot
Suite Setup         Begin Web Test
Suite Teardown      End Web Test

*** Test Cases ***
verify user can calculate dana pensiun and back to recalculate
    [Documentation]    This scenario for calculate dana pensiun dan hitung ulang
    [Tags]             positive    danapensiun    calculate    recalculate   
    [Template]         Calculate dana pensiun and recalculate
    6000000    5          29        45        80        10        4            
    random     random     random    random    random    random    random

verify user can calculate dana pensiun and get result
    [Documentation]    This scenario for calculate dana pensiun and get result
    [Tags]             positive    danapensiun    calculate    getresult
    [Template]         Calculate dana pensiun and get result
    random     random    random    random    random    random    random
    