*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    BuiltIn

*** Variables ***
${BASE_URL}    http://localhost:3001

*** Keywords ***
Get Is Prime JSON
    [Arguments]    ${x}
    ${resp}=     GET    ${BASE_URL}/is_prime/${x}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}

*** Test Cases ***
Test Is Prime when x is 17 (After Using Keywords)
    ${json_resp}=    Get Is Prime JSON    17
    Should Be Equal As Numbers    ${json_resp['isPrime']}    ${True}

Test Is Prime when x is 36 (After Using Keywords)
    ${json_resp}=    Get Is Prime JSON    36
    Should Be Equal As Numbers    ${json_resp['isPrime']}    ${False}

Test Is Prime when x is 13219 (After Using Keywords)
    ${json_resp}=    Get Is Prime JSON    13219
    Should Be Equal As Numbers    ${json_resp['isPrime']}    ${True}
