*** Settings ***
Documentation     Lesson 9: Kiểm thử API
...               Mục tiêu: Học cách thực hiện kiểm thử API sử dụng Robot Framework.
Library           RequestsLibrary
Library           Collections
Library           String

*** Variables ***
${BASE_URL}       https://pokeapi.co/api/v2
${POKEMON_ENDPOINT}    /pokemon

*** Test Cases ***
Ví dụ: Kiểm Tra GET Request Danh Sách Pokémon
    [Documentation]    Minh họa cách thực hiện và kiểm tra GET request để lấy danh sách Pokémon
    Create Session    pokeapi    ${BASE_URL}
    ${response}=    GET On Session    pokeapi    ${POKEMON_ENDPOINT}
    Status Should Be    200    ${response}
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Integers    ${json}[count]    1281    # Số lượng có thể thay đổi theo thời gian
    Should Not Be Empty    ${json}[results]

Ví dụ: Kiểm Tra Thông Tin Của Một Pokémon Cụ Thể
    [Documentation]    Minh họa cách lấy và kiểm tra thông tin của một Pokémon cụ thể
    Create Session    pokeapi    ${BASE_URL}
    ${pokemon_name}=    Set Variable    pikachu
    ${response}=    GET On Session    pokeapi    ${POKEMON_ENDPOINT}/${pokemon_name}
    Status Should Be    200    ${response}
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${json}[name]    pikachu
    Should Be Equal As Integers    ${json}[id]    25

Bài Tập: Tìm Kiếm Pokémon Theo Tên
    [Documentation]    Bài tập: Tìm kiếm một Pokémon theo tên và kiểm tra các thuộc tính
    Create Session    pokeapi    ${BASE_URL}
    ${pokemon_name}=    Set Variable    charizard
    ${response}=    GET On Session    pokeapi    ${POKEMON_ENDPOINT}/${pokemon_name}
    Status Should Be    200    ${response}
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${json}[name]    charizard
    Should Be Equal As Integers    ${json}[weight]    905
    Should Contain    ${json}[types][0][type][name]    fire

Bài Tập: Kiểm Tra Danh Sách Các Khả Năng Của Pokémon
    [Documentation]    Bài tập: Lấy danh sách các khả năng của một Pokémon và kiểm tra
    Create Session    pokeapi    ${BASE_URL}
    ${pokemon_name}=    Set Variable    ditto
    ${response}=    GET On Session    pokeapi    ${POKEMON_ENDPOINT}/${pokemon_name}
    Status Should Be    200    ${response}
    ${json}=    Set Variable    ${response.json()}
    ${abilities}=    Set Variable    ${json}[abilities]
    Length Should Be    ${abilities}    2
    Should Be Equal As Strings    ${abilities}[0][ability][name]    limber
    Should Be Equal As Strings    ${abilities}[1][ability][name]    imposter

*** Keywords ***
Status Should Be
    [Arguments]    ${expected_status}    ${response}
    Should Be Equal As Strings    ${expected_status}    ${response.status_code}