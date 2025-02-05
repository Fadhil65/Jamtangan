*** Variables ***
${popup_oke}    xpath=//button[contains(text(), 'OKE')]
${popup_notif}    id=moe-dontallow_button
${menu}    id=login-button
${username_field}    name=username
${password_field}    name=password
${button_login}    xpath=//button[contains(@class, 'qa-login-button')]
${search_field}    xpath=//input[@data-testid='search-input']
${search_related}    xpath=//span[@class='new-ds-text-neutral-200 text-sm search-content__related-product__title']
${button_add_to_cart}    id=btn-add-to-cart
${button_add_to_cart_popup}    id=btn-cta
${button_cart}    xpath=//span[@class='ic-cart text-primary-1 qa-cart-button justify-end flex']
${button_cart_minus}    xpath=//span[@class='ic-minus text-neutral-300']
