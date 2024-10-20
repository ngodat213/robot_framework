*** Settings ***
Documentation     Lesson 3: Library và Resource
...               Mục tiêu: Tìm hiểu cách sử dụng thư viện và tài nguyên bên ngoài.
Library           OperatingSystem
Library           BuiltIn
Resource          resource_file.robot

*** Variables ***
${TEST_FILE}      test_file.txt
${FILE_CONTENT}   Đây là nội dung của file test.

*** Test Cases ***
Ví dụ Sử Dụng OperatingSystem Library
    [Documentation]    Minh họa cách sử dụng OperatingSystem Library
    Create File    ${TEST_FILE}    ${FILE_CONTENT}
    ${content}=    Get File    ${TEST_FILE}
    Should Be Equal    ${content}    ${FILE_CONTENT}
    Remove File    ${TEST_FILE}
    File Should Not Exist    ${TEST_FILE}

Bài Tập: Sử Dụng OperatingSystem Library
    [Documentation]    Bài tập: Tạo, ghi và xóa một tệp
    ${file_name}=    Set Variable    my_test_file.txt
    ${file_content}=    Set Variable    Đây là nội dung của file bài tập.
    Create File    ${file_name}    ${file_content}
    ${read_content}=    Get File    ${file_name}
    Should Be Equal    ${read_content}    ${file_content}
    Remove File    ${file_name}
    File Should Not Exist    ${file_name}

Sử Dụng Resource File
    [Documentation]    Minh họa cách sử dụng resource file
    ${result}=    Tính Tổng    5    3
    Should Be Equal As Integers    ${result}    8
    Log    ${GREETING}
    Chào Hỏi    Robot Framework