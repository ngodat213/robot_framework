*** Settings ***
Documentation     Lesson 8: Viết thư viện Python tùy chỉnh (Advanced Custom Libraries)
...               Mục tiêu: Viết thư viện Python tùy chỉnh và tích hợp với Robot Framework.
Library           ${CURDIR}/custom_math_library.py

*** Variables ***
${RADIUS}         5
${BASE}           6
${HEIGHT}         4
${FIBONACCI_N}    10
${PRIME_NUMBER}   17
${NON_PRIME_NUMBER}    24

*** Test Cases ***
Ví dụ Sử Dụng Thư Viện Tùy Chỉnh - Tính Diện Tích Hình Tròn
    [Documentation]    Minh họa cách sử dụng thư viện tùy chỉnh để tính diện tích hình tròn
    ${area}=    Calculate Circle Area    ${RADIUS}
    ${expected_area}=    Evaluate    math.pi * ${RADIUS}**2
    Should Be Equal As Numbers    ${area}    ${expected_area}    precision=4

Ví dụ Sử Dụng Thư Viện Tùy Chỉnh - Tính Diện Tích Tam Giác
    [Documentation]    Minh họa cách sử dụng thư viện tùy chỉnh để tính diện tích tam giác
    ${area}=    Calculate Triangle Area    ${BASE}    ${HEIGHT}
    ${expected_area}=    Evaluate    0.5 * ${BASE} * ${HEIGHT}
    Should Be Equal As Numbers    ${area}    ${expected_area}

Bài Tập: Sử Dụng Thư Viện Tùy Chỉnh - Tính Số Fibonacci
    [Documentation]    Bài tập: Sử dụng thư viện tùy chỉnh để tính số Fibonacci
    ${fibonacci}=    Calculate Fibonacci    ${FIBONACCI_N}
    ${expected_fibonacci}=    Set Variable    55
    Should Be Equal As Integers    ${fibonacci}    ${expected_fibonacci}

Bài Tập: Sử Dụng Thư Viện Tùy Chỉnh - Kiểm Tra Số Nguyên Tố
    [Documentation]    Bài tập: Sử dụng thư viện tùy chỉnh để kiểm tra số nguyên tố
    ${is_prime_result}=    Is Prime    ${PRIME_NUMBER}
    Should Be True    ${is_prime_result}
    ${is_not_prime_result}=    Is Prime    ${NON_PRIME_NUMBER}
    Should Not Be True    ${is_not_prime_result}

*** Keywords ***
Kiểm Tra Số Nguyên Tố Và In Kết Quả
    [Arguments]    ${number}
    ${result}=    Is Prime    ${number}
    Run Keyword If    ${result}    Log    ${number} là số nguyên tố
    ...    ELSE    Log    ${number} không phải là số nguyên tố