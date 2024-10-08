*** Settings ***
Documentation     Lesson 10: Kiểm thử với Database
...               Mục tiêu: Học cách thực hiện kiểm thử với cơ sở dữ liệu sử dụng Robot Framework.
Library           DatabaseLibrary
Library           OperatingSystem

*** Variables ***
${DBName}         ${CURDIR}/test_database.db
${DBTable}        users

*** Test Cases ***
Kiểm Tra Và Tạo File Cơ Sở Dữ Liệu
    [Documentation]    Kiểm tra xem file cơ sở dữ liệu có tồn tại không và tạo nếu cần
    ${file_exists}=    Run Keyword And Return Status    File Should Exist    ${DBName}
    Run Keyword If    not ${file_exists}    Create File    ${DBName}
    File Should Exist    ${DBName}

Thiết Lập Cơ Sở Dữ Liệu
    [Documentation]    Tạo kết nối đến cơ sở dữ liệu và tạo bảng
    Connect To Database Using Custom Params    sqlite3    database='${DBName}'
    ${output}=    Execute SQL String    CREATE TABLE IF NOT EXISTS ${DBTable} (id INTEGER PRIMARY KEY, name TEXT, email TEXT)
    Log    ${output}
    
Ví Dụ: Chèn Dữ Liệu
    [Documentation]    Minh họa cách chèn dữ liệu vào cơ sở dữ liệu
    Execute SQL String    INSERT INTO ${DBTable} (name, email) VALUES ('John Doe', 'john@example.com')
    Execute SQL String    INSERT INTO ${DBTable} (name, email) VALUES ('Jane Smith', 'jane@example.com')
    
Ví Dụ: Truy Vấn Dữ Liệu
    [Documentation]    Minh họa cách truy vấn và kiểm tra dữ liệu
    ${queryResults}=    Query    SELECT * FROM ${DBTable}
    Log    ${queryResults}
    Length Should Be    ${queryResults}    2
    Should Be Equal As Strings    ${queryResults[0][1]}    John Doe
    
Bài Tập: Cập Nhật Dữ Liệu
    [Documentation]    Bài tập: Cập nhật dữ liệu và kiểm tra kết quả
    Execute SQL String    UPDATE ${DBTable} SET email='john.doe@newdomain.com' WHERE name='John Doe'
    ${queryResults}=    Query    SELECT email FROM ${DBTable} WHERE name='John Doe'
    Should Be Equal As Strings    ${queryResults[0][0]}    john.doe@newdomain.com
    
Bài Tập: Xóa Dữ Liệu
    [Documentation]    Bài tập: Xóa dữ liệu và kiểm tra kết quả
    Execute SQL String    DELETE FROM ${DBTable} WHERE name='Jane Smith'
    ${queryResults}=    Query    SELECT * FROM ${DBTable}
    Length Should Be    ${queryResults}    1
    Should Not Contain    ${queryResults}    Jane Smith
    
[Teardown]    Dọn Dẹp Cơ Sở Dữ Liệu

*** Keywords ***
Dọn Dẹp Cơ Sở Dữ Liệu
    Disconnect From Database
    Remove File    ${DBName}