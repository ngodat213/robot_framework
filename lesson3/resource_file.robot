*** Settings ***
Documentation     File resource chứa các từ khóa và biến tái sử dụng

*** Variables ***
${GREETING}       Xin chào từ resource file!

*** Keywords ***
Tính Tổng
    [Arguments]    ${số_1}    ${số_2}
    [Documentation]    Tính tổng hai số
    ${tổng}=    Evaluate    ${số_1} + ${số_2}
    [Return]    ${tổng}

Chào Hỏi
    [Arguments]    ${tên}
    [Documentation]    In ra lời chào
    Log    Xin chào, ${tên}!