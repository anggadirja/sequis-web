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
    Wait Until Element Is Visible    ${inputIncomePerMonth}
    Clear Element Text               ${inputIncomePerMonth}
    Input Text    ${inputIncomePerMonth}    5000000

user input tingkat inflasi
    Wait Until Element Is Visible    ${inputTingkatInflasi}
    Clear Element Text    ${inputTingkatInflasi}
    Input Text    ${inputTingkatInflasi}    5

user click button selanjutnya for step1 on financaial calculator page
    Wait Until Element Is Visible    ${buttonSelanjutnyaStep1OnFinancialCalculatorPage}
    Click Element    ${buttonSelanjutnyaStep1OnFinancialCalculatorPage}

user input current income
    user input income permonth
    user input tingkat inflasi
    user click button selanjutnya for step1 on financaial calculator page

user input usia saat ini
    Wait Until Element Is Visible    ${inputUsiaSaatIni}
    Clear Element Text    ${inputUsiaSaatIni}
    Input Text    ${inputUsiaSaatIni}    29

user input usia pensiun
    Wait Until Element Is Visible    ${inputUsiaPensiun}
    Clear Element Text    ${inputUsiaPensiun}
    Input Text    ${inputUsiaPensiun}    50

user click button selanjutnya for step2 on financaial calculator page
    Wait Until Element Is Visible    ${buttonSelanjutnyaStep2OnFinancialCalculatorPage}
    Click Element    ${buttonSelanjutnyaStep2OnFinancialCalculatorPage}

user input data umur
    user input usia saat ini
    user input usia pensiun
    user click button selanjutnya for step2 on financaial calculator page

user input rasio penggantian 
    Wait Until Element Is Visible    ${inputRasioPenggantian}
    Clear Element Text    ${inputRasioPenggantian}
    Input Text    ${inputRasioPenggantian}    80

user click button selanjutnya for step3 on financaial calculator page
    Wait Until Element Is Visible    ${buttonSelanjutnyaStep3OnFinancialCalculatorPage}
    Click Element    ${buttonSelanjutnyaStep3OnFinancialCalculatorPage}

user input data rasio penggantian
    user input rasio penggantian
    user click button selanjutnya for step3 on financaial calculator page

user input lama pensiun
    Wait Until Element Is Visible    ${inputLamaPensiun}
    Clear Element Text    ${inputLamaPensiun}
    Input Text    ${inputLamaPensiun}    10

user input suku bunga deposito 
    Wait Until Element Is Visible    ${inputSukubungaDeposito}
    Clear Element Text    ${inputSukubungaDeposito}
    Input Text    ${inputSukubungaDeposito}    4

user click button selanjutnya for step4 on financaial calculator page
    Scroll Element Into View    ${buttonSelanjutnyaStep4OnFinancialCalculatorPage}
    Wait Until Element Is Visible    ${buttonSelanjutnyaStep4OnFinancialCalculatorPage}
    Click Element    ${buttonSelanjutnyaStep4OnFinancialCalculatorPage}

user input data pemasukan saat usia pensiun
    user input lama pensiun
    user input suku bunga deposito
    user click button selanjutnya for step4 on financaial calculator page

user input data for caculate dana pensiun
    user input current income
    user input data umur
    user input data rasio penggantian
    user input data pemasukan saat usia pensiun