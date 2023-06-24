*** Settings ***
Library            SeleniumLibrary
Resource    DanaPensiunPage.robot

*** Variables ***
${inputIncomePerMonth}                                    xpath=//label[text()='Penghasilan Anda Per Bulan']/following-sibling::div//input
${inputTingkatInflasi}                                    xpath=//label[contains(text(),'Tingkat inflasi')]/following-sibling::input
${inputUsiaSaatIni}                                       xpath=//label[contains(text(),'Usia Anda Saat Ini')]/following-sibling::input
${inputUsiaPensiun}                                       xpath=//label[contains(text(),'Usia Pensiun')]/following-sibling::input[@type='number']
${inputRasioPenggantian}                                  xpath=//label[contains(text(),'Rasio Penggantian')]/following-sibling::input[@type='number']
${textIncomePensiun}                                      xpath=//span[@id='fv']
${inputLamaPensiun}                                       xpath=//label[contains(text(),'Lama pensiun')]/following-sibling::input[@type='number']
${inputSukubungaDeposito}                                 xpath=//label[contains(text(),'Suku Bunga Deposito')]/following-sibling::input[@type='number']
${buttonSelanjutnyaStep1OnFinancialCalculatorPage}        xpath=(//button[@type='button' and contains(text(),'Selanjutnya')])[1]
${buttonSelanjutnyaStep2OnFinancialCalculatorPage}        xpath=(//button[@type='button' and contains(text(),'Selanjutnya')])[2]
${buttonSelanjutnyaStep3OnFinancialCalculatorPage}        xpath=(//button[@type='button' and contains(text(),'Selanjutnya')])[3]
${buttonSelanjutnyaStep4OnFinancialCalculatorPage}        xpath=//button[@id='financial-pensiun-step4']

*** Keywords ***
user is on financaial calculator page
    Wait Until Element Is Visible    ${inputIncomePerMonth}
    Element Should Be Visible        ${inputIncomePerMonth}

user input income permonth 
    [Arguments]    ${incomePerMonth}
    Wait Until Element Is Visible    ${inputIncomePerMonth}
    Clear Element Text               ${inputIncomePerMonth}
    Run Keyword If                   '${incomePerMonth}' == 'random'    get random value for income per month
    ...    ELSE                      Set Global Variable                ${IncomePerMonthValue}                    ${incomePerMonth}
    Input Text                       ${inputIncomePerMonth}             ${IncomePerMonthValue}

get random value for income per month
    ${random}                        Evaluate                           random.randint(5000000, 10000000)        modules=random
    Set Global Variable              ${IncomePerMonthValue}             ${random}
    
user input tingkat inflasi
    [Arguments]    ${tingkatInflasi}
    Wait Until Element Is Visible     ${inputTingkatInflasi}
    Clear Element Text                ${inputTingkatInflasi}
    Run Keyword If                    '${tingkatInflasi}'=='random'    get random value for tingkat inflasi
    ...    ELSE                       Set Global Variable              ${TingkatInflasiValue}                ${tingkatInflasi}
    Input Text                        ${inputTingkatInflasi}           ${TingkatInflasiValue}

get random value for tingkat inflasi
    ${random}              Evaluate                  random.randint(3,6)    modules=random
    Set Global Variable    ${TingkatInflasiValue}    ${random}

user click button selanjutnya for step1 on financaial calculator page
    Wait Until Element Is Visible    ${buttonSelanjutnyaStep1OnFinancialCalculatorPage}
    Click Element                    ${buttonSelanjutnyaStep1OnFinancialCalculatorPage}

user input current income
    [Arguments]    ${incomePerMonth}    ${tingkatInflasi}
    user input income permonth    ${incomePerMonth}
    user input tingkat inflasi    ${tingkatInflasi}
    user click button selanjutnya for step1 on financaial calculator page

user input usia saat ini
    [Arguments]    ${currentAge}
    Wait Until Element Is Visible    ${inputUsiaSaatIni}
    Clear Element Text               ${inputUsiaSaatIni}
    Run Keyword If                   '${currentAge}' == 'random'    get random value for current age
    ...    ELSE                      Set Global Variable            ${CurrentAgeValue}                ${currentAge}
    Input Text                       ${inputUsiaSaatIni}            ${CurrentAgeValue}

get random value for current age
    ${random}                Evaluate                random.randint(17, 30)    modules=random
    Set Global Variable      ${CurrentAgeValue}      ${random}
user input usia pensiun
    [Arguments]    ${retirementAge}
    Wait Until Element Is Visible    ${inputUsiaPensiun}
    Clear Element Text               ${inputUsiaPensiun}
    Run Keyword If                   '${retirementAge}'=='random'    get random value for retirement age
    ...    ELSE                      Set Global Variable             ${RetirementAgeValue}                ${retirementAge}
    Input Text                       ${inputUsiaPensiun}             ${RetirementAgeValue}

get random value for retirement age
    ${random}              Evaluate                 random.randint(40,60)    modules=random
    Set Global Variable    ${RetirementAgeValue}    ${random}

user click button selanjutnya for step2 on financaial calculator page
    Wait Until Element Is Visible    ${buttonSelanjutnyaStep2OnFinancialCalculatorPage}
    Click Element                    ${buttonSelanjutnyaStep2OnFinancialCalculatorPage}

user input data umur
    [Arguments]    ${currentAge}    ${retirementAge}
    user input usia saat ini    ${currentAge}
    user input usia pensiun     ${retirementAge}    
    user click button selanjutnya for step2 on financaial calculator page

user input rasio penggantian 
    [Arguments]    ${rasioPennggantian}
    Wait Until Element Is Visible    ${inputRasioPenggantian}
    Clear Element Text               ${inputRasioPenggantian}
    Run Keyword If                   '${rasioPennggantian}'=='random'    get random value for rasio pensiun
    ...    ELSE                      Set Global Variable                 ${RasioPenggantianValue}                ${rasioPennggantian}
    Input Text                       ${inputRasioPenggantian}            ${RasioPenggantianValue}

get random value for rasio pensiun
    ${random}                Evaluate                    random.randint(75,125)
    Set Global Variable      ${RasioPenggantianValue}    ${random}

user click button selanjutnya for step3 on financaial calculator page
    Wait Until Element Is Visible    ${buttonSelanjutnyaStep3OnFinancialCalculatorPage}
    Click Element                    ${buttonSelanjutnyaStep3OnFinancialCalculatorPage}

user input data rasio penggantian
    [Arguments]    ${rasioPennggantian}
    user input rasio penggantian    ${rasioPennggantian}
    user click button selanjutnya for step3 on financaial calculator page

user input lama pensiun
    [Arguments]    ${lamaPensiun}
    Wait Until Element Is Visible    ${inputLamaPensiun}
    Clear Element Text               ${inputLamaPensiun}
    Run Keyword If                   '${lamaPensiun}' == 'random'    get random value for lama pensiun
    ...    ELSE                      Set Global Variable             ${LamaPensiunValue}                ${lamaPensiun}
    Input Text                       ${inputLamaPensiun}             ${LamaPensiunValue}

get random value for lama pensiun
    ${random}              Evaluate               random.randint(1, 50)    modules=random
    Set Global Variable    ${LamaPensiunValue}    ${random}

user input suku bunga deposito 
    [Arguments]    ${bungaDeposito}
    Wait Until Element Is Visible    ${inputSukubungaDeposito}
    Clear Element Text               ${inputSukubungaDeposito}
    Run Keyword If                   '${bungaDeposito}'=='random'    get random value for bunga deposito
    ...    ELSE                      Set Global Variable             ${BungaDepositoValue}                ${bungaDeposito}
    Input Text                       ${inputSukubungaDeposito}       ${BungaDepositoValue}

get random value for bunga deposito
    ${random}                Evaluate                 random.randint(3,6)    modules=random
    Set Global Variable      ${BungaDepositoValue}    ${random}

user click button selanjutnya for step4 on financaial calculator page
    Scroll Element Into View            ${buttonSelanjutnyaStep4OnFinancialCalculatorPage}
    Wait Until Element Is Visible       ${buttonSelanjutnyaStep4OnFinancialCalculatorPage}
    Click Element                       ${buttonSelanjutnyaStep4OnFinancialCalculatorPage}

user input data pemasukan saat usia pensiun
    [Arguments]    ${lamaPensiun}    ${bungaDeposito}
    user input lama pensiun    ${lamaPensiun}        
    user input suku bunga deposito    ${bungaDeposito}
    user click button selanjutnya for step4 on financaial calculator page

user input data for caculate dana pensiun
    [Arguments]    ${incomePerMonth}    ${tingkatInflasi}    ${currentAge}    ${retirementAge}    ${rasioPennggantian}    ${lamaPensiun}    ${bungaDeposito}
    user input current income    ${incomePerMonth}    ${tingkatInflasi}
    user input data umur    ${currentAge}    ${retirementAge}
    user input data rasio penggantian    ${rasioPennggantian}
    user input data pemasukan saat usia pensiun    ${lamaPensiun}    ${bungaDeposito}