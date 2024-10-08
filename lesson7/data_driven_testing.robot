*** Settings ***
Documentation     Lesson 7: Data-Driven Testing (Kiểm thử dữ liệu)
...               Mục tiêu: Hiểu cách thực hiện kiểm thử với nhiều dữ liệu đầu vào.
Library           SeleniumLibrary
Library           Collections
Library           OperatingSystem
Library           CSVLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            file://${CURDIR}/../lesson4/simple_web_page.html
${CSV_FILE}       ${CURDIR}/login_data.csv

*** Test Cases ***
Ví dụ Sử Dụng For Loop
    [Documentation]    Minh họa cách sử dụng For Loop để lặp qua nhiều dữ liệu
    @{colors}=    Create List    red    green    blue    yellow
    FOR    ${color}    IN    @{colors}
        Log    Màu hiện tại: ${color}
    END

Ví dụ Sử Dụng CSV Làm Nguồn Dữ Liệu
    [Documentation]    Minh họa cách sử dụng tệp CSV làm nguồn dữ liệu đầu vào
    ${data}=    Read CSV File    ${CSV_FILE}
    FOR    ${row}    IN    @{data}
        Log    Username: ${row}[0], Password: ${row}[1], Expected Result: ${row}[2]
    END

Bài Tập: Kiểm Thử Đăng Nhập Với Nhiều Tài Khoản
    [Documentation]    Bài tập: Tạo test case kiểm thử đăng nhập với nhiều tài khoản từ CSV
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    ${data}=    Read CSV File    ${CSV_FILE}
    FOR    ${row}    IN    @{data}
        ${username}=    Set Variable    ${row}[0]
        ${password}=    Set Variable    ${row}[1]
        ${expected}=    Set Variable    ${row}[2]
        ${result}=    Run Keyword And Return Status    Đăng Nhập Và Kiểm Tra    ${username}    ${password}    ${expected}
        Run Keyword If    ${result} == ${TRUE}    Log    Đăng nhập thành công với ${username}
        ...    ELSE    Log    Đăng nhập thất bại với ${username}
        Reload Page
    END
    [Teardown]    Close Browser

Bài Tập: Kiểm Tra Nhiều Phần Tử Trên Trang Web
    [Documentation]    Bài tập: Sử dụng vòng lặp để kiểm tra nhiều phần tử trên trang web
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    @{elements}=    Create List    loginForm    username    password    searchForm    searchInput
    FOR    ${element}    IN    @{elements}
        ${status}=    Run Keyword And Return Status    Element Should Be Visible    id=${element}
        Run Keyword If    ${status}    Log    Phần tử ${element} hiển thị
        ...    ELSE    Log    Phần tử ${element} không hiển thị
    END
    [Teardown]    Close Browser

*** Keywords ***
Đăng Nhập Và Kiểm Tra
    [Arguments]    ${username}    ${password}    ${expected}
    Input Text    id=username    ${username}
    Input Password    id=password    ${password}
    Click Button    css=button[type='submit']
    ${status}=    Run Keyword And Return Status    Page Should Contain    ${expected}
    Run Keyword If    '${expected}' == 'success'    Run Keywords
    ...    Page Should Contain    Chào mừng
    ...    AND    Page Should Not Contain    Đăng nhập thất bại
    ...    ELSE    Page Should Contain    Đăng nhập thất bại
    [Return]    ${status}