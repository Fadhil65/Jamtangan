*** Settings ***
Library    SeleniumLibrary
Resource          ../resources/variables.robot
Resource          ../resources/locators.robot
Resource          ../data/data.robot    #login_data.robot Import data dari login_data.robot


*** Keywords ***

Given I open jamtangan
    Open Browser    ${URL}    chrome
    Maximize Browser Window

And click menu masuk
    ${status}    ${message} =    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${popup_oke}    timeout=5s
    Run Keyword If    '${status}' == 'PASS'    Click Element    ${popup_oke}
    Run Keyword If    '${status}' == 'FAIL'    Log    "OKE button not found, skipping popup interaction."

    Wait Until Element Is Visible    ${popup_notif}    timeout=5s
    Run Keyword If    '${status}' == 'PASS'    Click Element    ${popup_notif}
    Run Keyword If    '${status}' == 'FAIL'    Log    "nanti saja button not found, skipping popup interaction."
    Click Button    ${menu}


Then I input credentials account
    # Mengambil panjang dari list LOGIN_CREDENTIALS
    ${half_len}=    Get Length    ${LOGIN_CREDENTIALS}  # Keyword ini digunakan untuk mendapatkan jumlah total elemen dalam list ${LOGIN_CREDENTIALS}. Misalnya, jika list tersebut berisi 4 elemen seperti [username1, password1, username2, password2], maka hasilnya adalah 4.
    
    # Membagi panjang list dengan 2 untuk mendapatkan jumlah pasangan username dan password
    ${half_len}=    Evaluate    ${half_len} // 2  # Setelah mendapatkan panjang dari list, kita bagi dengan 2 (// untuk pembagian integer). Hal ini karena setiap pasangan username dan password memiliki dua elemen dalam list. Jadi, jika panjang list adalah 4, maka kita ingin memproses 2 pasangan.
    # Melakukan perulangan untuk memasukkan username dan password berdasarkan indeks
    FOR    ${i}    IN RANGE    0    ${half_len}  # Loop ini akan dimulai dari indeks 0 dan berjalan hingga half_len-1. Misalnya, jika panjang list adalah 4, maka loop akan berjalan untuk i=0 dan i=1, yang masing-masing mewakili pasangan username dan password.
        # Memasukkan username yang berada pada indeks 2*i (setiap pasangan username berada pada indeks genap)
        Input Text      ${username_field}    ${LOGIN_CREDENTIALS}[${i*2}]  # Isi username, Mengambil username pada indeks genap (misalnya, indeks 0 dan 2). Ini dilakukan dengan cara mengakses ${LOGIN_CREDENTIALS}[${i*2}], di mana i adalah indeks dalam loop. Untuk i=0, ini akan mengakses elemen pertama (username pertama), dan untuk i=1, ini akan mengakses elemen ketiga (username kedua).
        
        # Memasukkan password yang berada pada indeks 2*i+1 (setiap pasangan password berada pada indeks ganjil)
        Input Text      ${password_field}    ${LOGIN_CREDENTIALS}[${i*2+1}]  # Isi password, Mengambil password pada indeks ganjil (misalnya, indeks 1 dan 3). Ini dilakukan dengan cara mengakses ${LOGIN_CREDENTIALS}[${i*2+1}], yang akan mengakses elemen kedua (password pertama) saat i=0 dan elemen keempat (password kedua) saat i=1.
        Wait Until Element Is Visible    ${button_login}
        Click Button    ${button_login}
        Sleep    3s
    END
    Wait Until Element Is Visible    ${Avatar_icon}


Then I search
    [Arguments]    ${key_search}
    Input Text    ${search_field}    ${key_search}
    Wait Until Element Is Visible    ${search_related}    2s
    Click Element    ${search_related}

And click button add to cart
    Click Button    ${button_add_to_cart}
    Click Element    ${button_add_to_cart_popup}

Then click icon cart
    Click Element    ${button_cart}
    Click Element    ${button_cart_minus}
