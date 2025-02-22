*** Settings ***
Library           RequestsLibrary

*** Variables ***
${BASE_URL}       http://localhost:5000/is_prime

*** Keywords ***
Test Plus Endpoint
    [Arguments]    ${num}        ${expected_status}
    ${response}=    GET    ${BASE_URL}/${num}    expected_status=${expected_status}
    IF    ${response.status_code} == ${expected_status}    RETURN    ${response.json()}
    Fail    Unexpected status code: ${response.status_code}

*** Test Cases ***
Test True When X Is 17
    ${result}=    Test Plus Endpoint    17    200
    Should Be Equal    ${result}[result]    ${True}

Test False When X Is 36
    ${result}=    Test Plus Endpoint    36    200
    Should Be Equal    ${result}[result]    ${False}

Test True When X Is 13219
    ${result}=    Test Plus Endpoint    13219    200
    Should Be Equal    ${result}[result]    ${True}
    