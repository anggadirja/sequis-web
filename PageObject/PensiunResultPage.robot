*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${buttonHitungUlangOnPensiunResultPage}                     xpath=//input[@value='Hitung Ulang']
${buttonDapatkanHasilOnPensiunResultPage}                   xpath=//a[@href='#' and text()='Dapatkan Hasil']
${inputEmailOnForm}                                         xpath=//input[@id='email']
${inputPhoneOnForm}                                         xpath=//input[@id='phone']
${inputAddressOnForm}                                       xpath=//input[@id='address']
${buttonProvinceOnForm}                                     xpath=//select[@id='province']/parent::span
${dropdownOptionProvinceOnForm}                             xpath=(//select[@id='province']/option[contains(text(),'Silakan pilih')]/following-sibling::option)
${buttonCityOnForm}                                         xpath=//select[@id='city']/parent::span
${dropdownOptionCityOnForm}                                 xpath=(//select[@id='city']/option[contains(text(),'Silahkan Pilih')]/following-sibling::option)
${textApproveTNCOnForm}                                     xpath=//label[text()='Saya bersedia dihubungi untuk mendapatkan informasi selanjutnya dari Sequis']
${buttonGetResultOnForm}                                    xpath=//button[@id='save-financial']

*** Keywords ***
user is on pensiun result page
    Wait Until Element Is Visible    ${buttonHitungUlangOnPensiunResultPage}
    Element Should Be Visible        ${buttonHitungUlangOnPensiunResultPage}
    Element Should Be Visible        ${buttonDapatkanHasilOnPensiunResultPage}

user click hitung ulang on pensiun result page
    Wait Until Element Is Visible    ${buttonHitungUlangOnPensiunResultPage}
    Click Element                    ${buttonHitungUlangOnPensiunResultPage}

user click dapatkan hasil on pensiun result page
    Wait Until Element Is Visible    ${buttonDapatkanHasilOnPensiunResultPage}
    Click Element                    ${buttonDapatkanHasilOnPensiunResultPage}

user input email on form get pensiun result
    Wait Until Element Is Visible    ${inputEmailOnForm}
    Input Text    ${inputEmailOnForm}    testangga21@gmail.com

user input phone on form get pensiun result
    Wait Until Element Is Visible    ${inputPhoneOnForm}
    Input Text    ${inputPhoneOnForm}    +6285775533511

user input address on form get pensiun result
    Wait Until Element Is Visible    ${inputAddressOnForm}
    Input Text    ${inputAddressOnForm}    jalan buntu

user click for province option on form get pensiun result
    Wait Until Element Is Visible    ${buttonProvinceOnForm}
    Click Element    ${buttonProvinceOnForm}

user choose province option on form get pensiun result
    Wait Until Element Is Visible    ${dropdownOptionProvinceOnForm}
    ${totalprovince}                 Get Element Count                         ${dropdownOptionProvinceOnForm}
    ${random}                        Evaluate                                  random.randint(1, ${totalprovince})        modules=random
    ${index}                         Catenate                                  [${random}]
    ${provincename}                  Get Text                                  ${dropdownOptionProvinceOnForm}${index}
    # Set Global Variable                      ${searchQuery}                    ${groupname}
    Set Global Variable              ${ProvinceName}                           ${provincename}
    Click Element                    ${dropdownOptionProvinceOnForm}${index}

user click for city option on form get pensiun result
    Wait Until Element Is Visible    ${buttonCityOnForm}
    Click Element    ${buttonCityOnForm}

user choose city option on form get pensiun result
    Wait Until Element Is Visible    ${dropdownOptionCityOnForm}
    ${totalcity}                     Get Element Count                         ${dropdownOptionCityOnForm}
    ${random}                        Evaluate                                  random.randint(1, ${totalcity})        modules=random
    ${index}                         Catenate                                  [${random}]
    ${cityname}                      Get Text                                  ${dropdownOptionCityOnForm}${index}
    # Set Global Variable                      ${searchQuery}                    ${groupname}
    Set Global Variable              ${CityName}                               ${cityname}
    Click Element                    ${dropdownOptionCityOnForm}${index}

user click approve TNC on form get pensiun result
    Wait Until Element Is Visible    ${textApproveTNCOnForm}
    Click Element                    ${textApproveTNCOnForm}

user click button dapatkan sekarang on form get pensiun result
    Wait Until Element Is Visible    ${buttonGetResultOnForm}
    Click Element    ${buttonGetResultOnForm}

user input data to get pensiun result
    user input email on form get pensiun result
    user input phone on form get pensiun result
    user input address on form get pensiun result
    user click for province option on form get pensiun result
    user choose province option on form get pensiun result
    user click for city option on form get pensiun result
    user choose city option on form get pensiun result
    user click approve TNC on form get pensiun result
    user click button dapatkan sekarang on form get pensiun result

form get pensiun result should be closed
    Wait Until Element Is Not Visible      ${inputEmailOnForm}    timeout=10
    Page Should Not Contain Element        ${inputEmailOnForm}