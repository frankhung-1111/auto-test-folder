*** Settings ***
#Resource    ./base.robot

*** Variables ***

*** Keywords ***
Verify PMF is Disabled
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0
    ${result}=    cli    DUT_serial_port    \n    prompt=root@
    sleep    2
    ${result}=    cli    DUT_serial_port    gnvram show | grep PMFEnabled    prompt=root@
    log    ${result}
    Should Contain    ${result}    PMFEnabled=0

Verify PMF is Enabled
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0
    ${result}=    cli    DUT_serial_port    \n    prompt=root@
    sleep    2
    ${result}=    cli    DUT_serial_port    gnvram show | grep PMFEnabled    prompt=root@
    log    ${result}
    Should Contain    ${result}    PMFEnabled=1


Waiting 90 seconds
    sleep    90

Click Agree Button on "Terms of Service and Privacy Policy" Page
    Open Browser    ${URL}    Chrome
    sleep    3
    Maximize Browser Window
    sleep    5
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    Click Element    id=lang_have_read_and_agree
    sleep    2
    Click Element    id=ml-agree
    sleep    2

Select Agent Mode
    Click Element    id=agent-mode-card
    sleep    2
    Click Element    id=ml-next
    sleep    2

Select "Setup via Ethernet" than click Next Button
    Click Element    id=ethernet-setup-btn
    sleep    2
    Click Element    id=ml-next
    sleep    10



Select Router Mode
    Click Element    id=router-mode-card
    sleep    2
    Click Element    id=ml-next
    sleep    2

Click Next Button on "Get Your Device Ready" Page
    Click Element    id=ml-next
    sleep    2

Select DUT WAM Mode to Static IP than click Next Button
    Select From List By Value    id=connection_type_select    static
    sleep    2
    Input Text    id=static_ip    172.16.11.11
    sleep    2
    Input Text    id=static_mask    255.255.255.0
    sleep    2
    Input Text    id=static_gatway    172.16.11.1
    sleep    2
    Input Text    id=static_dns1    8.8.8.8
    sleep    2
    Input Text    id=static_dns2    168.95.1.1
    Click Element    id=ml-next
    sleep    2


Select DUT WAM Mode to PPPoE than click Next Button
    Select From List By Value    id=connection_type_select    pppoe
    sleep    2
    Input Text    id=ppp_name    cisco
    sleep    2
    Input Text    id=ppp_pwd    cisco
    sleep    2
    Click Element    id=ml-next
    sleep    2

Select DUT WAM Mode to DHCP than click Next Button
    Select From List By Value    id=connection_type_select    dhcp
    sleep    2
    Click Element    id=ml-next
    sleep    2

Enable Smart Mesh than click Next Button
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_enable_mesh_btn    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_enable_mesh_btn
    sleep    2
    Click Element    id=ml-next
    sleep    2

Disable Smart Mesh than click Next Button
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_enable_mesh_btn    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal checked'    click element    id=switch_layout_enable_mesh_btn
    sleep    2
    Click Element    id=ml-next
    sleep    2

Disable PSC
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_PMF_enable    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_PMF_enable
    sleep    2

Enable MLO
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_MLO_enable    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_MLO_enable
    sleep    2

Disable MLO
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_MLO_enable    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal checked'    click element    id=switch_layout_MLO_enable
    sleep    2

Disable "Smart Connect"
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_single_ssid_enable    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal checked'    click element    id=switch_layout_single_ssid_enable
    sleep    2

Enable "Smart Connect"
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_single_ssid_enable    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_single_ssid_enable
    sleep    2

Disable PMF than click Next Button
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_PMF_enable    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal checked'    click element    id=switch_layout_PMF_enable
    sleep    2
    Click Element    id=ml-next
    sleep    2

Enable PMF than click Next Button
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_PMF_enable    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_PMF_enable
    sleep    2
    Click Element    id=ml-next
    sleep    2


Enable PSC
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_psc_enable6    class
    log    ${enable_or_disable}
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_psc_enable6
    sleep    2


Enable WiFi 6G, Security Type is WPA3-Personal
    [Arguments]    ${ssid}    ${wifi_password}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Input Text    id=6g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_6g    wpa3
    sleep    2
    Input Text    id=6g_wpa_key    ${wifi_password}
    sleep    2

Enable WiFi 5G, Security Type is WPA3-Personal
    [Arguments]    ${ssid}    ${wifi_password}
    Execute JavaScript    window.scrollTo(0, 300)
    sleep    2
    Input Text    id=5g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_5g    wpa3
    sleep    2
    Input Text    id=5g_wpa_key    ${wifi_password}
    sleep    2

Enable WiFi 2.4G, Security Type is WPA3/WPA2-Personal
    [Arguments]    ${ssid}    ${wifi_password}
    Input Text    id=2g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_2g    mixed3
    sleep    2
    Input Text    id=2g_wpa_key    ${wifi_password}
    sleep    2

Enable WiFi 5G, Security Type is WPA3/WPA2-Personal
    [Arguments]    ${ssid}    ${wifi_password}
    Execute JavaScript    window.scrollTo(0, 300)
    sleep    2
    Input Text    id=5g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_5g    mixed3
    sleep    2
    Input Text    id=5g_wpa_key    ${wifi_password}
    sleep    2

Enable WiFi 2.4G, Security Type is Open
    [Arguments]    ${ssid}
    Input Text    id=2g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_2g    open
    sleep    2

Enable WiFi 5G, Security Type is Open
    [Arguments]    ${ssid}
    Input Text    id=5g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_5g    open
    sleep    2

Enable WiFi 6G, Security Type is Open
    [Arguments]    ${ssid}
    Input Text    id=6g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_6g    open
    sleep    2





Enable WiFi 2.4G, Security Type is WPA3-Personal
    [Arguments]    ${ssid}    ${wifi_password}
    Input Text    id=2g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_2g    wpa3
    sleep    2
    Input Text    id=2g_wpa_key    ${wifi_password}
    sleep    2

Enable WiFi 5G, Security Type is WPA2-Personal
    [Arguments]    ${ssid}    ${wifi_password}
    Execute JavaScript    window.scrollTo(0, 300)
    sleep    2
    Input Text    id=5g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_5g    wpa2
    sleep    2
    Input Text    id=5g_wpa_key    ${wifi_password}
    sleep    2

Enable WiFi 2.4G, Security Type is WPA2-Personal
    [Arguments]    ${ssid}    ${wifi_password}
    Input Text    id=2g_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_2g    wpa2
    sleep    2
    Input Text    id=2g_wpa_key    ${wifi_password}
    sleep    2

Verify WiFi 2.4G/5G Authentication can be WPA3 or WP3/WP2 or WPA2 or Open
    ${result}=    Get List Items    id=authtype_2g
    Should Contain    ${result}    WPA3 PSK
    Should Contain    ${result}    WPA3/WPA2 PSK
    Should Contain    ${result}    OPEN
    Should Contain    ${result}    WPA2 PSK

    ${result}=    Get List Items    id=authtype_5g
    Should Contain    ${result}    WPA3 PSK
    Should Contain    ${result}    WPA3/WPA2 PSK
    Should Contain    ${result}    OPEN
    Should Contain    ${result}    WPA2 PSK

Verify WiFi 6G Authentication can be WPA3 or WP3/WP2 or Open
    ${result}=    Get List Items    id=authtype_6g
    Should Contain    ${result}    WPA3 PSK
    Should Contain    ${result}    OPEN
    Close Browser

Verify WiFi 2.4G/5G/6G Authentication can be WPA3 or WP3/WP2 or Open
    ${result}=    Get List Items    id=authtype_2g
    Should Contain    ${result}    WPA3 PSK
    Should Contain    ${result}    WPA3/WPA2 PSK
    Should Contain    ${result}    OPEN
    Should Not Contain    ${result}    WPA2 PSK

    ${result}=    Get List Items    id=authtype_5g
    Should Contain    ${result}    WPA3 PSK
    Should Contain    ${result}    WPA3/WPA2 PSK
    Should Contain    ${result}    OPEN
    Should Not Contain    ${result}    WPA2 PSK

    ${result}=    Get List Items    id=authtype_6g
    Should Contain    ${result}    WPA3 PSK
    Should Contain    ${result}    OPEN
    Should Not Contain    ${result}    WPA2 PSK
    Close Browser


Verify Authentication can be WPA3 or WP3/WP2 or Open
    ${result}=    Get List Items    id=authtype_commong
    Should Contain    ${result}    WPA3 PSK
    Should Contain    ${result}    WPA3/WPA2 PSK
    Should Contain    ${result}    OPEN
    Should Not Contain    ${result}    WPA2 PSK



Verify Authentication can be WPA3 or WP3/WP2 or WPA2 or Open
    Select From List By Value    id=authtype_commong    wpa3
    sleep    1
    Select From List By Value    id=authtype_commong    mixed3
    sleep    1
    Select From List By Value    id=authtype_commong    wpa2
    sleep    1
    Select From List By Value    id=authtype_commong    open
    sleep    1

Config WiFi Settings than click Next Button
    [Arguments]    ${ssid}    ${authentication_type}    ${wifi_password}
    Input Text    id=commong_ssid    ${ssid}
    sleep    2
    Select From List By Value    id=authtype_commong    ${authentication_type}
    sleep    2
    Run Keyword If      '${authentication_type}'!='open'    Input Text    id=commong_wpa_key    ${wifi_password}
    sleep    2
    Click Element    id=ml-next
    sleep    2

Enter Admin Password than click Next Button
    [Arguments]    ${admin_password}
    Input Text    id=new_pwd    ${admin_password}
    sleep    2
    Input Text    id=confirm_pwd    ${admin_password}
    sleep    2
    Click Element    id=ml-next
    sleep    2

Verify the "SETTINGS SUMMARY" When "Disable Smart Connect"
    [Arguments]    ${wan_type}    ${smart_connect_status}    ${mlo_status}    ${ssid_2G}    ${ssid_5G}    ${ssid_6G}    ${wifi_password}    ${security_type_2G}    ${security_type_5G}    ${security_type_6G}    ${mesh_status}    ${admin_password}    ${psc_status}    ${pmf_status}
    ${result}=    Get Text    id=summary-connection-type
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${wan_type}

    ${result}=    Get Text    id=summary-smart-connect
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${smart_connect_status}

    ${result}=    Get Text    id=summary-mlo-network
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${mlo_status}

    ${result}=    Get Text    id=summary-2g-authtype
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${security_type_2G}

    ${result}=    Get Text    id=summary-5g-authtype
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${security_type_5G}

    ${result}=    Get Text    id=summary-6g-authtype
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${security_type_6G}

    ${result}=    Get Text    id=summary-2g-ssid
    Should Be Equal    ${result}    ${ssid_2G}

    IF    '${security_type_2G}'!='open'
        ${result}=    Get Text    id=summary-2g-password
        Should Be Equal    ${result}    ${wifi_password}
    END
    
    ${result}=    Get Text    id=summary-5g-ssid
    Should Be Equal    ${result}    ${ssid_5G}

    IF    '${security_type_5G}'!='open'
        ${result}=    Get Text    id=summary-5g-password
        Should Be Equal    ${result}    ${wifi_password}
    END

    ${result}=    Get Text    id=summary-6g-ssid
    Should Be Equal    ${result}    ${ssid_6G}

    IF    '${security_type_6G}'!='open'
        ${result}=    Get Text    id=summary-6g-password
        Should Be Equal    ${result}    ${wifi_password}
    END
    
    ${result}=    Get Text    id=summary-smart-mesh
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${mesh_status}


    ${result}=    Get Text    id=summary--admin-password
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${admin_password}

    ${result}=    Get Text    id=summary-pmf-enable
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${pmf_status}

    ${result}=    Get Text    id=summary-psc-enable
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${psc_status}

    Click Element    id=ml-apply
    sleep    10
    ${result}=    Get Text    id=routerPageTitle
    Should Contain    ${result}    Applying Settings...
    sleep    140
    ${result}=    Get Text    id=ml-finish
    Should Contain    ${result}    Finish!
    Click Element    id=btn-redirect
    sleep    4
    Input Text    id=acnt_username    admin
    sleep    2
    Close Browser


Verify the "SETTINGS SUMMARY"
    [Arguments]    ${wan_type}    ${smart_connect_status}    ${mlo_status}    ${ssid}    ${wifi_password}    ${security_type}    ${mesh_status}    ${admin_password}
    ${result}=    Get Text    id=summary-connection-type
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${wan_type}

    ${result}=    Get Text    id=summary-smart-connect
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${smart_connect_status}

    ${result}=    Get Text    id=summary-mlo-network
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${mlo_status}

    ${result}=    Get Text    id=summary-ssid
    Should Be Equal    ${result}    ${ssid}

    IF    '${security_type}'!='open'
        ${result}=    Get Text    id=summary-wifi-password
        Should Be Equal    ${result}    ${wifi_password}
    END

    ${result}=    Get Text    id=summary-wifi-authtype
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${security_type}

    ${result}=    Get Text    id=summary-smart-mesh
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${mesh_status}
    
    ${result}=    Get Text    id=summary--admin-password
    ${result}=    Convert To Lower Case    ${result}
    Should Be Equal    ${result}    ${admin_password}

    Click Element    id=ml-apply
    sleep    10
    ${result}=    Get Text    id=routerPageTitle
    Should Contain    ${result}    Applying Settings...
    sleep    140
    ${result}=    Get Text    id=ml-finish
    Should Contain    ${result}    Finish!
    Click Element    id=btn-redirect
    sleep    4
    Input Text    id=acnt_username    admin
    sleep    2
    Close Browser

Verify Login Username and Password
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    Chrome
    sleep    3
    Maximize Browser Window
    sleep    5
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    ${result}=    Get Text    id=homepage_tile
    Should Be Equal    ${result}    Home

Verify DUT WAN Interface is Static IP address
    ${result}=    Get Text    id=dashboard_internet_protocol
    Should Be Equal    ${result}    STATIC
    ${result}=    Get Text    id=dashboard_internet_address
    Should Contain    ${result}    172.16.11.11
    Close Browser

Verify DUT WAN Interface can get IP address from PPPoE Server
    ${result}=    Get Text    id=dashboard_internet_protocol
    Should Be Equal    ${result}    PPPoE
    ${result}=    Get Text    id=dashboard_internet_address
    Should Contain    ${result}    172.19.
    Close Browser

Verify DUT WAN Interface can get IP address from DHCP Server
    Wait Until Keyword Succeeds    3x    60s    retry Verify DUT WAN Interface can get IP address from DHCP Server
    Close Browser

retry Verify DUT WAN Interface can get IP address from DHCP Server
    Reload Page
    sleep   6
    ${result}=    Get Text    id=dashboard_internet_protocol
    Should Be Equal    ${result}    DHCP
    ${result}=    Get Text    id=dashboard_internet_address
    Should Contain    ${result}    172.16.11.
    

Verify MLO is Enabled
    Open Browser    ${URL}    Chrome
    sleep    3
    Maximize Browser Window
    sleep    5
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    Click Element    id=lang_mainmenu_basic_setting
    sleep    2
    Click Element    id=menu_basic_setting_wlan
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_MLO_enable    class
    log    ${enable_or_disable}
    Should Be Equal    ${enable_or_disable}    switch hidden-dom-removal checked
    Close Browser

Verify MLO is Disabled
    Open Browser    ${URL}    Chrome
    sleep    3
    Maximize Browser Window
    sleep    5
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    Click Element    id=lang_mainmenu_basic_setting
    sleep    2
    Click Element    id=menu_basic_setting_wlan
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_MLO_enable    class
    log    ${enable_or_disable}
    Should Be Equal    ${enable_or_disable}    switch hidden-dom-removal
    Close Browser


Verify Mesh is Disabled
    Open Browser    ${URL}    Chrome
    sleep    3
    Maximize Browser Window
    sleep    5
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    Click Element    id=lang_mainmenu_basic_setting
    sleep    2
    Click Element    id=menu_basic_setting_wlan
    sleep    2
    Click Element    id=tab_mesh
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_enable_btn    class
    log    ${enable_or_disable}
    Should Be Equal    ${enable_or_disable}    switch hidden-dom-removal
    Close Browser

Verify Mesh Network can be Setup [Ethernet Onboarding]
    Power OFF than Power ON Agent
    Up Agent Interface
    sleep    240
    Verify mesh topology from GUI, it should display Controller and Agent

Verify PSC is Disabled
    Open Browser    ${URL}    Chrome
    sleep    3
    Maximize Browser Window
    sleep    5
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    Click Element    id=lang_mainmenu_basic_setting
    sleep    2
    Click Element    id=menu_basic_setting_wlan
    sleep    2
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_psc_enable6    class
    log    ${enable_or_disable}
    Should Be Equal    ${enable_or_disable}    switch hidden-dom-removal
    Close Browser

Verify PSC is Enabled
    Open Browser    ${URL}    Chrome
    sleep    3
    Maximize Browser Window
    sleep    5
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    Click Element    id=lang_mainmenu_basic_setting
    sleep    2
    Click Element    id=menu_basic_setting_wlan
    sleep    2
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_psc_enable6    class
    log    ${enable_or_disable}
    Should Be Equal    ${enable_or_disable}    switch hidden-dom-removal checked
    Close Browser

Connect DUT and Controller by Ethernet
    Down Cisco Router Interface
    Down WAN Interface
    sleep    310
    Capture Page Screenshot
    ${result}=     Get Text    xpath=/html/body/div[4]/div[4]/div[15]/div/h3
    Should Contain    ${result}    Finish!
    sleep    6
    Click Element    id=btn-redirect-controller
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    Close Browser

Power-ON Controller
    Run    python3 /home/vagrant/apc_script_power_on_port6.py
    sleep    30

Power-OFF Controller
    Run    python3 /home/vagrant/apc_script_power_off_port6.py

Verify DUT is Agent Mode
    Open Browser    ${URL}    Chrome
    sleep    3
    Maximize Browser Window
    sleep    5
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    Open Mesh information Page
    IF    ${Platform}=='SPF12'
        ${result}=    Get Text    xpath=//*[@id="Mesh_topology_table_id_0"]/td[6]
    ELSE IF    ${Platform}=='SPF13'
        ${result}=    Get Text    xpath=//*[@id="Mesh_topology_table_id_0"]/td[7]
    END

    Should Be Equal    ${result}    Controller
    IF    ${Platform}=='SPF12'
        ${result}=    Get Text    xpath=//*[@id="Mesh_topology_table_id_1"]/td[6]
    ELSE IF    ${Platform}=='SPF13'
        ${result}=    Get Text    xpath=//*[@id="Mesh_topology_table_id_1"]/td[7]
    END

    Should Be Equal    ${result}    Agent
    sleep    2
    Close Browser


Disconnect DUT And Controller
    Up Cisco Router Interface
    Up WAN Interface
    Power-OFF Controller


Down Cisco Router Interface
    Telnet.Open Connection    ${DEVICES.cisco_LAN_Switch.ip}    timeout=60    prompt=${DEVICES.cisco_LAN_Switch.prompt}     port=${DEVICES.cisco_LAN_Switch.port}
    Telnet.Login    ${DEVICES.cisco_LAN_Switch.user_name}    ${DEVICES.cisco_LAN_Switch.password}    login_prompt=${DEVICES.cisco_LAN_Switch.login_prompt}    password_prompt=${DEVICES.cisco_LAN_Switch.password_prompt}
    Telnet.Set Timeout    ${DEVICES.cisco_LAN_Switch.timeout}
    ${result}=    Telnet.Read
    sleep    2
    Telnet.Set Prompt    LAN-SW>
    ${result}=    Telnet.Execute Command    \r
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    enable
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config)#
    ${result}=    Telnet.Execute Command    config t
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    interface ${Cisco_Router_Interface}
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    shutdown
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    end
    log    ${result}
    Telnet.Set Prompt    Press RETURN to get started
    ${result}=    Telnet.Execute Command    exit
    log    ${result}
    Telnet.Close All Connections
    sleep    2

Up Cisco Router Interface
    Telnet.Open Connection    ${DEVICES.cisco_LAN_Switch.ip}    timeout=60    prompt=${DEVICES.cisco_LAN_Switch.prompt}     port=${DEVICES.cisco_LAN_Switch.port}
    Telnet.Login    ${DEVICES.cisco_LAN_Switch.user_name}    ${DEVICES.cisco_LAN_Switch.password}    login_prompt=${DEVICES.cisco_LAN_Switch.login_prompt}    password_prompt=${DEVICES.cisco_LAN_Switch.password_prompt}
    Telnet.Set Timeout    ${DEVICES.cisco_LAN_Switch.timeout}
    ${result}=    Telnet.Read
    sleep    2
    Telnet.Set Prompt    LAN-SW>
    ${result}=    Telnet.Execute Command    \r
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    enable
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config)#
    ${result}=    Telnet.Execute Command    config t
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    interface ${Cisco_Router_Interface}
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    no shutdown
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    end
    log    ${result}
    Telnet.Set Prompt    Press RETURN to get started
    ${result}=    Telnet.Execute Command    exit
    log    ${result}
    Telnet.Close All Connections
    sleep    2



Down Controller Interface
    Telnet.Open Connection    ${DEVICES.cisco_LAN_Switch.ip}    timeout=60    prompt=${DEVICES.cisco_LAN_Switch.prompt}     port=${DEVICES.cisco_LAN_Switch.port}
    Telnet.Login    ${DEVICES.cisco_LAN_Switch.user_name}    ${DEVICES.cisco_LAN_Switch.password}    login_prompt=${DEVICES.cisco_LAN_Switch.login_prompt}    password_prompt=${DEVICES.cisco_LAN_Switch.password_prompt}
    Telnet.Set Timeout    ${DEVICES.cisco_LAN_Switch.timeout}
    ${result}=    Telnet.Read
    sleep    2
    Telnet.Set Prompt    LAN-SW>
    ${result}=    Telnet.Execute Command    \r
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    enable
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config)#
    ${result}=    Telnet.Execute Command    config t
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    interface ${Controller_Interface}
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    shutdown
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    end
    log    ${result}
    Telnet.Set Prompt    Press RETURN to get started
    ${result}=    Telnet.Execute Command    exit
    log    ${result}
    Telnet.Close All Connections
    sleep    2


Up Controller Interface
    Telnet.Open Connection    ${DEVICES.cisco_LAN_Switch.ip}    timeout=60    prompt=${DEVICES.cisco_LAN_Switch.prompt}     port=${DEVICES.cisco_LAN_Switch.port}
    Telnet.Login    ${DEVICES.cisco_LAN_Switch.user_name}    ${DEVICES.cisco_LAN_Switch.password}    login_prompt=${DEVICES.cisco_LAN_Switch.login_prompt}    password_prompt=${DEVICES.cisco_LAN_Switch.password_prompt}
    Telnet.Set Timeout    ${DEVICES.cisco_LAN_Switch.timeout}
    ${result}=    Telnet.Read
    sleep    2
    Telnet.Set Prompt    LAN-SW>
    ${result}=    Telnet.Execute Command    \r
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    enable
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config)#
    ${result}=    Telnet.Execute Command    config t
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    interface ${Controller_Interface}
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    no shutdown
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    end
    log    ${result}
    Telnet.Set Prompt    Press RETURN to get started
    ${result}=    Telnet.Execute Command    exit
    log    ${result}
    Telnet.Close All Connections
    sleep    2

Up Agent to Controller Interface
    Telnet.Open Connection    ${DEVICES.cisco_LAN_Switch.ip}    timeout=60    prompt=${DEVICES.cisco_LAN_Switch.prompt}     port=${DEVICES.cisco_LAN_Switch.port}
    Telnet.Login    ${DEVICES.cisco_LAN_Switch.user_name}    ${DEVICES.cisco_LAN_Switch.password}    login_prompt=${DEVICES.cisco_LAN_Switch.login_prompt}    password_prompt=${DEVICES.cisco_LAN_Switch.password_prompt}
    Telnet.Set Timeout    ${DEVICES.cisco_LAN_Switch.timeout}
    ${result}=    Telnet.Read
    sleep    2
    Telnet.Set Prompt    LAN-SW>
    ${result}=    Telnet.Execute Command    \r
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    enable
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config)#
    ${result}=    Telnet.Execute Command    config t
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    interface ${Agent_to_Controller_Interface}
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    no shutdown
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    end
    log    ${result}
    Telnet.Set Prompt    Press RETURN to get started
    ${result}=    Telnet.Execute Command    exit
    log    ${result}
    Telnet.Close All Connections
    sleep    2

Down Agent to Controller Interface
    Telnet.Open Connection    ${DEVICES.cisco_LAN_Switch.ip}    timeout=60    prompt=${DEVICES.cisco_LAN_Switch.prompt}     port=${DEVICES.cisco_LAN_Switch.port}
    Telnet.Login    ${DEVICES.cisco_LAN_Switch.user_name}    ${DEVICES.cisco_LAN_Switch.password}    login_prompt=${DEVICES.cisco_LAN_Switch.login_prompt}    password_prompt=${DEVICES.cisco_LAN_Switch.password_prompt}
    Telnet.Set Timeout    ${DEVICES.cisco_LAN_Switch.timeout}
    ${result}=    Telnet.Read
    sleep    2
    Telnet.Set Prompt    LAN-SW>
    ${result}=    Telnet.Execute Command    \r
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    enable
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config)#
    ${result}=    Telnet.Execute Command    config t
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    interface ${Agent_to_Controller_Interface}
    log    ${result}
    Telnet.Set Prompt    LAN-SW(config-if)#
    ${result}=    Telnet.Execute Command    shutdown
    log    ${result}
    Telnet.Set Prompt    LAN-SW#
    ${result}=    Telnet.Execute Command    end
    log    ${result}
    Telnet.Set Prompt    Press RETURN to get started
    ${result}=    Telnet.Execute Command    exit
    log    ${result}
    Telnet.Close All Connections
    sleep    2

Verify GUI Display ERROR!
    sleep    320
    ${result}=    Get Text    xpath=/html/body/div[4]/div[4]/div[16]/div/h3
    Should Contain    ${result}    ERROR!
    sleep    2
    Close Browser




