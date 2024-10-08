*** Settings ***
Documentation     Lesson 6: Tạo từ khóa tùy chỉnh (Custom Keywords)
...               Mục tiêu: Tạo từ khóa tùy chỉnh để sử dụng lại và mở rộng các chức năng trong test case.
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${BROWSER}        chrome
${URL}            file://${CURDIR}/../lesson4/simple_web_page.html
${VALID_USER}     user
${VALID_PASS}     pass

*** Test Cases ***
Ví dụ Sử Dụng Từ Khóa Tùy Chỉnh Cộng Hai Số
    [Documentation]    Minh họa cách sử dụng từ khóa tùy chỉnh để cộng hai số
    ${kết_quả}=    Cộng Hai Số    5    3
    Should Be Equal As Integers    ${kết_quả}    8
    ${kết_quả_2}=    Cộng Hai Số    10    -2
    Should Be Equal As Integers    ${kết_quả_2}    8

Ví dụ Sử Dụng Từ Khóa Tùy Chỉnh Đăng Nhập
    [Documentation]    Minh họa cách sử dụng từ khóa tùy chỉnh để đăng nhập
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Đăng Nhập Tùy Chỉnh    ${VALID_USER}    ${VALID_PASS}
    Page Should Contain    Chào mừng, user!
    [Teardown]    Close Browser

Bài Tập: Tạo và Sử Dụng Từ Khóa Tùy Chỉnh Tính Diện Tích Hình Chữ Nhật
    [Documentation]    Bài tập: Tạo từ khóa tính diện tích hình chữ nhật và sử dụng trong test case
    ${diện_tích}=    Tính Diện Tích Hình Chữ Nhật    4    5
    Should Be Equal As Numbers    ${diện_tích}    20
    ${diện_tích_2}=    Tính Diện Tích Hình Chữ Nhật    3.5    2
    Should Be Equal As Numbers    ${diện_tích_2}    7

Bài Tập: Tạo và Sử Dụng Từ Khóa Tùy Chỉnh Kiểm Tra Đăng Nhập
    [Documentation]    Bài tập: Tạo từ khóa kiểm tra đăng nhập và sử dụng trong test case
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${kết_quả}=    Kiểm Tra Đăng Nhập    ${VALID_USER}    ${VALID_PASS}
    Should Be True    ${kết_quả}
    ${kết_quả_sai}=    Kiểm Tra Đăng Nhập    ${VALID_USER}    mật_khẩu_sai
    Should Not Be True    ${kết_quả_sai}
    [Teardown]    Close Browser

*** Keywords ***
Cộng Hai Số
    [Arguments]    ${số_1}    ${số_2}
    [Documentation]    Từ khóa tùy chỉnh để cộng hai số
    ${tổng}=    Evaluate    ${số_1} + ${số_2}
    [Return]    ${tổng}

Đăng Nhập Tùy Chỉnh
    [Arguments]    ${username}    ${password}
    [Documentation]    Từ khóa tùy chỉnh để đăng nhập vào trang web
    Input Text    id=username    ${username}
    Input Password    id=password    ${password}
    Click Button    css=button[type='submit']

Tính Diện Tích Hình Chữ Nhật
    [Arguments]    ${chiều_dài}    ${chiều_rộng}
    [Documentation]    Từ khóa tùy chỉnh để tính diện tích hình chữ nhật
    ${diện_tích}=    Evaluate    ${chiều_dài} * ${chiều_rộng}
    [Return]    ${diện_tích}

Kiểm Tra Đăng Nhập
    [Arguments]    ${username}    ${password}
    [Documentation]    Từ khóa tùy chỉnh để kiểm tra đăng nhập
    Input Text    id=username    ${username}
    Input Password    id=password    ${password}
    Click Button    css=button[type='submit']
    ${status}=    Run Keyword And Return Status    Page Should Contain    Chào mừng
    [Return]    ${status}