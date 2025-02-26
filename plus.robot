*** Settings ***
Library           RequestsLibrary

*** Variables ***
${BASE_URL}       http://localhost:5000/cir_area

*** Keywords ***
Test Plus Endpoint
    [Arguments]    ${num}        ${expected_status}
    ${response}=    GET    ${BASE_URL}/${num}    expected_status=${expected_status}
    IF    ${response.status_code} == ${expected_status}    RETURN    ${response.json()}
    Fail    Unexpected status code: ${response.status_code}

Test Plus API
    [Arguments]    ${num1}        ${num2}        ${expected_status}
    ${response}=    GET    ${BASE_URL}/${num1}/${num2}    expected_status=${expected_status}
    IF    ${response.status_code} == ${expected_status}    RETURN    ${response.json()}
    Fail    Unexpected status code: ${response.status_code}

*** Test Cases ***
Test True When X Is 1
    ${result}=    Test Plus Endpoint    1    200
    Should Be Equal    ${result}[result]    ${3.14}

Test False When X Is -10
    ${result}=    Test Plus Endpoint    -10    200
    Should Be Equal    ${result}[result]    ${0.00}

Test True When X Is 1.5
    ${result}=    Test Plus Endpoint    1.5    200
    Should Be Equal    ${result}[result]    ${7.07}