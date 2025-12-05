*** Settings ***
Resource    ../base.robot
Library    OperatingSystem
Force Tags    @Function=Somke_Test    @AUTHOR=Frank_Hung    @FEATURE=Function
Resource    ../../keyword/kw_Wizard_FrankHung.robot
Resource    ../../keyword/kw_Basic_WAN_FrankHung.robot
Resource    ../../keyword/kw_Basic_WiFi_FrankHung.robot
Resource    ../../keyword/kw_testlink_FrankHung.robot
#Test Teardown    print debug message to console
Suite Setup    Up WAN Interface
#Suite Setup    Open Web GUI and Reboot Wifi_Client    ${URL}
#Suite Setup    Open Web GUI and Reset to Default    ${URL}    ${DUT_Password}
Suite Teardown    Up WAN Interface

*** Variables ***

*** Test Cases ***


Reboot Cisco Router
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    v6 Server setup, M bit 1
    Reboot Cisco Router and waiting 180 seconds
    Up WAN Interface

Reboot LAN PC
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    cli    lanhost    echo '${DEVICES.lanhost.password}' | sudo -S /sbin/shutdown -r +1
    sleep    60
    Up WAN Interface

Reset DUT
    [Tags]    @AUTHOR=Frank_Hung    rebootTag    p1Tag
    Run    echo 'vagrant' | sudo -S netplan apply
    sleep    4
    Reset DUT from Console

Create SSID Name for auto test
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    testing2
    ${result}=    Generate Random String    8    [NUMBERS]
    ${ssid}=    Catenate    SEPARATOR=    ssid-    ${result}
    ${ssid_2G}=    Catenate    SEPARATOR=    2G-    ${result}
    ${ssid_5G}=    Catenate    SEPARATOR=    5G-    ${result}
    ${ssid_6G}=    Catenate    SEPARATOR=    6G-    ${result}
    Set Suite Variable    ${ssid}    ${ssid}
    Set Suite Variable    ${ssid_2G}    ${ssid_2G}
    Set Suite Variable    ${ssid_5G}    ${ssid_5G}
    Set Suite Variable    ${ssid_6G}    ${ssid_6G}
    Set Suite Variable    ${wifi_password}    ghijGHIJK/

G-CPE-1019 Wizard/Router Mode/DHCP/Enable Smart Connect/Disable MLO/Disable Smart Mesh
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    
    Click Agree Button on "Terms of Service and Privacy Policy" Page    #issue Content is blnak
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to DHCP than click Next Button
    Disable Smart Mesh than click Next Button
    Disable MLO
    Enable "Smart Connect"
    Verify Authentication can be WPA3 or WP3/WP2 or Open
    Config WiFi Settings than click Next Button    ${ssid}    wpa3    ${wifi_password}
    Enter Admin Password than click Next Button    admin
    Verify the "SETTINGS SUMMARY"    dhcp    enabled    disabled    ${ssid}    ${wifi_password}    wpa3 psk    disabled    admin
    Waiting 90 seconds

    Verify Login Username and Password    admin    admin
    Verify DUT WAN Interface can get IP address from DHCP Server
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid}    ${wifi_password}
    Verify MLO is Disabled
    Verify Mesh is Disabled
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink and Reset DUT from Console    G-CPE-1019




G-CPE-1020 Wizard/Router Mode/DHCP/Enable Smart Connect/Disable MLO/[Enable Smart Mesh]
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to DHCP than click Next Button
    Enable Smart Mesh than click Next Button
    Disable MLO
    Enable "Smart Connect"
    Verify Authentication can be WPA3 or WP3/WP2 or Open
    Config WiFi Settings than click Next Button    ${ssid}    mixed3    ${wifi_password}
    Enter Admin Password than click Next Button    admin
    Verify the "SETTINGS SUMMARY"    dhcp    enabled    disabled    ${ssid}    ${wifi_password}    wpa3/wpa2 psk    enabled    admin
    Waiting 90 seconds

    Verify Login Username and Password    admin    admin
    Verify DUT WAN Interface can get IP address from DHCP Server
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid}    ${wifi_password}
    Verify MLO is Disabled
    Verify Mesh Network can be Setup [Ethernet Onboarding]
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink, Down Agent Interface, and Reset DUT from Console    G-CPE-1020

G-CPE-1021 Wizard/Router Mode/DHCP/Enable Smart Connect/[Enable MLO]/Disable Smart Mesh
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to DHCP than click Next Button
    Disable Smart Mesh than click Next Button
    Enable MLO
    Enable "Smart Connect"
    Config WiFi Settings than click Next Button    ${ssid}    open    ${wifi_password}
    Enter Admin Password than click Next Button    admin
    Verify the "SETTINGS SUMMARY"    dhcp    enabled    enabled    ${ssid}    ${EMPTY}    open    disabled    admin    #issue
    Waiting 90 seconds

    Verify Login Username and Password    admin    admin
    Verify DUT WAN Interface can get IP address from DHCP Server
    Verify Wireless PC can connect to DUT and access to Internet (OPEN)    ${ssid}    #issue
    Verify MLO is Enabled
    Verify Mesh is Disabled
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink and Reset DUT from Console    G-CPE-1021

G-CPE-1048 Wizard/Router Mode/DHCP/[Disable Smart Connect][Enable WiFi 2.4G 5G 6G][Enable PSC][Disable PMF]/Disable MLO/Disable Smart Mesh
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to DHCP than click Next Button
    Disable Smart Mesh than click Next Button
    Disable MLO
    Disable "Smart Connect"
    Enable WiFi 2.4G, Security Type is WPA3-Personal    ${ssid_2G}    ${wifi_password}
    Enable WiFi 5G, Security Type is WPA3-Personal    ${ssid_5G}    ${wifi_password}
    Enable WiFi 6G, Security Type is WPA3-Personal    ${ssid_6G}    ${wifi_password}    #issue default value is blank
    Enable PSC
    Disable PMF than click Next Button    #issue firefox
    Enter Admin Password than click Next Button    admin
    Verify the "SETTINGS SUMMARY" When "Disable Smart Connect"    dhcp    disabled    disabled    ${ssid_2G}    ${ssid_5G}    ${ssid_6G}    ${wifi_password}    wpa3 psk    wpa3 psk    wpa3 psk    disabled    admin    enabled    disabled
    Waiting 90 seconds

    Verify Login Username and Password    admin    admin
    Verify DUT WAN Interface can get IP address from DHCP Server
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by nmcli    ${ssid_6G}    ${wifi_password}

    Verify PSC is Enabled
    Verify PMF is Disabled    #issue
    Verify MLO is Disabled
    Verify Mesh is Disabled
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink and Reset DUT from Console    G-CPE-1048

 G-CPE-1049 Wizard/Router Mode/DHCP/[Disable Smart Connect][Enable WiFi 2.4G 5G 6G][Enable PSC][Enable PMF]/Disable MLO/Disable Smart Mesh
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to DHCP than click Next Button
    Disable Smart Mesh than click Next Button
    Disable MLO
    Disable "Smart Connect"
    Enable WiFi 2.4G, Security Type is WPA2-Personal    ${ssid_2G}    ${wifi_password}
    Enable WiFi 5G, Security Type is WPA2-Personal    ${ssid_5G}    ${wifi_password}
    Enable WiFi 6G, Security Type is WPA3-Personal    ${ssid_6G}    ${wifi_password}
    Enable PSC
    Enable PMF than click Next Button
    Disable Smart Mesh than click Next Button
    Enter Admin Password than click Next Button    admin
    Verify the "SETTINGS SUMMARY" When "Disable Smart Connect"    dhcp    disabled    disabled    ${ssid_2G}    ${ssid_5G}    ${ssid_6G}    ${wifi_password}   wpa2 psk    wpa2 psk    wpa3 psk    disabled    admin    enabled    enabled
    Waiting 90 seconds

    Verify Login Username and Password    admin    admin
    Verify DUT WAN Interface can get IP address from DHCP Server
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_2G}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_5G}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by nmcli    ${ssid_6G}    ${wifi_password}
    Verify PSC is Enabled
    Verify PMF is Enabled
    Verify MLO is Disabled
    Verify Mesh is Disabled
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink and Reset DUT from Console     G-CPE-1049

G-CPE-1050 Wizard/Router Mode/DHCP/[Disable Smart Connect][Enable WiFi 2.4G 5G 6G][Disable PSC][Disable PMF]/Disable MLO/Disable Smart Mesh
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to DHCP than click Next Button
    Disable Smart Mesh than click Next Button
    Disable MLO
    Disable "Smart Connect"
    Enable WiFi 2.4G, Security Type is WPA3/WPA2-Personal    ${ssid_2G}    ${wifi_password}
    Enable WiFi 5G, Security Type is WPA3/WPA2-Personal    ${ssid_5G}    ${wifi_password}
    Enable WiFi 6G, Security Type is WPA3-Personal    ${ssid_6G}    ${wifi_password}
    Disable PSC
    Disable PMF than click Next Button
    Enter Admin Password than click Next Button    admin
    Verify the "SETTINGS SUMMARY" When "Disable Smart Connect"    dhcp    disabled    disabled    ${ssid_2G}    ${ssid_5G}    ${ssid_6G}    ${wifi_password}    wpa3/wpa2 psk    wpa3/wpa2 psk    wpa3 psk    disabled    admin    disabled    disabled
    Waiting 90 seconds

    Verify Login Username and Password    admin    admin
    Verify DUT WAN Interface can get IP address from DHCP Server
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_2G}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by nmcli    ${ssid_6G}    ${wifi_password}
    Verify PSC is Disabled
    Verify PMF is Disabled
    Verify MLO is Disabled
    Verify Mesh is Disabled
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink and Reset DUT from Console    G-CPE-1050


G-CPE-1051 Wizard/Router Mode/DHCP/[Disable Smart Connect][WiFi Authentication is Open][Enable PSC][Disable PMF]/Disable MLO/Disable Smart Mesh
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to DHCP than click Next Button
    Disable Smart Mesh than click Next Button
    Disable MLO
    Disable "Smart Connect"
    Enable WiFi 2.4G, Security Type is Open    ${ssid_2G}
    Enable WiFi 5G, Security Type is Open    ${ssid_5G}
    Enable WiFi 6G, Security Type is Open    ${ssid_6G}
    Enable PSC
    Disable PMF than click Next Button
    Enter Admin Password than click Next Button    admin
    Verify the "SETTINGS SUMMARY" When "Disable Smart Connect"    dhcp    disabled    disabled    ${ssid_2G}    ${ssid_5G}    ${ssid_6G}    ${EMPTY}    open    open    open    disabled    admin    enabled    disabled
    Waiting 90 seconds

    Verify Login Username and Password    admin    admin
    Verify DUT WAN Interface can get IP address from DHCP Server
    Verify Wireless PC can connect to DUT and access to Internet (OPEN)    ${ssid_2G}
    Verify Wireless PC can connect to DUT and access to Internet (OPEN)    ${ssid_5G}
    Verify Wireless PC can connect to DUT and access to Internet (OPEN)    ${ssid_6G}
    Verify PSC is Enabled
    Verify PMF is Disabled
    Verify MLO is Disabled
    Verify Mesh is Disabled
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink and Reset DUT from Console    G-CPE-1051

G-CPE-1052 Wizard/Verify WiFi 2.4G/5G/6G Authentication can be WPA3 or WP3/WP2 or Open When [Disable Smart Connect]/[Enable Smart Mesh]
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to DHCP than click Next Button
    Enable Smart Mesh than click Next Button
    Disable MLO
    Disable "Smart Connect"
    Verify WiFi 2.4G/5G/6G Authentication can be WPA3 or WP3/WP2 or Open
    [Teardown]    upload result to testlink    G-CPE-1052

G-CPE-1053 Wizard/Verify WiFi 2.4G/5G/6G Authentication can be WPA3 or WP3/WP2 or Open When [Disable Smart Connect]/[Disable Smart Mesh]
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to DHCP than click Next Button
    Disable Smart Mesh than click Next Button
    Disable MLO
    Disable "Smart Connect"
    Verify WiFi 2.4G/5G Authentication can be WPA3 or WP3/WP2 or WPA2 or Open
    Verify WiFi 6G Authentication can be WPA3 or WP3/WP2 or Open
    [Teardown]    upload result to testlink    G-CPE-1053




 G-CPE-1054 Wizard/Router Mode/[PPPoE]/Enable Smart Connect/Disable MLO/Disable Smart Mesh
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to PPPoE than click Next Button
    Disable Smart Mesh than click Next Button
    Disable MLO
    Enable "Smart Connect"
    Config WiFi Settings than click Next Button    ${ssid}    wpa3    ${wifi_password}
    Enter Admin Password than click Next Button    admin
    Verify the "SETTINGS SUMMARY"    pppoe    enabled    disabled    ${ssid}    ${wifi_password}    wpa3 psk    disabled    admin
    Waiting 90 seconds

    Verify Login Username and Password    admin    admin
    Verify DUT WAN Interface can get IP address from PPPoE Server
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid}    ${wifi_password}
    Verify MLO is Disabled
    Verify Mesh is Disabled
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink and Reset DUT from Console    G-CPE-1054

G-CPE-1055 Wizard/Router Mode/[Static IP]/Enable Smart Connect/Disable MLO/Disable Smart Mesh
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Router Mode
    Click Next Button on "Get Your Device Ready" Page
    Select DUT WAM Mode to Static IP than click Next Button
    Disable Smart Mesh than click Next Button
    Disable MLO
    Enable "Smart Connect"
    Config WiFi Settings than click Next Button    ${ssid}    wpa3    ${wifi_password}
    Enter Admin Password than click Next Button    admin
    Verify the "SETTINGS SUMMARY"    static ip    enabled    disabled    ${ssid}    ${wifi_password}    wpa3 psk    disabled    admin
    Waiting 90 seconds

    Verify Login Username and Password    admin    admin
    Verify DUT WAN Interface is Static IP address
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid}    ${wifi_password}
    Verify MLO is Disabled
    Verify Mesh is Disabled
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink and Reset DUT from Console    G-CPE-1055

G-CPE-1056 Wizard/Agent Mode (Ethernet Onboarding)
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    testing2
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Agent Mode
    Power-ON Controller
    Select "Setup via Ethernet" than click Next Button
    Connect DUT and Controller by Ethernet


    Verify DUT is Agent Mode
    Verify LAN PC can access Internet
    [Teardown]    upload result to testlink and Reset DUT from Console and Disconnect DUT and Controller    G-CPE-1056


G-CPE-1057 Wizard/Agent Mode (Ethernet Onboarding Fail)
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Click Agree Button on "Terms of Service and Privacy Policy" Page
    Select Agent Mode
    Select "Setup via Ethernet" than click Next Button
    Verify GUI Display ERROR!
    [Teardown]    upload result to testlink and Disconnect DUT and Controller    G-CPE-1057



***Comments***





*** Keywords ***
upload result to testlink and Reset DUT from Console
    [Arguments]    ${testCaseID}
    upload result to testlink    ${testCaseID}
    Reset DUT from Console

upload result to testlink and Reset DUT from Console and Disconnect DUT and Controller
    [Arguments]    ${testCaseID}
    upload result to testlink    ${testCaseID}
    Disconnect DUT And Controller
    Reset DUT from Console

upload result to testlink, Down Agent Interface, and Reset DUT from Console
    [Arguments]    ${testCaseID}
    upload result to testlink    ${testCaseID}
    Down Agent Interface
    Reset DUT from Console

upload result to testlink and Disconnect DUT and Controller
    [Arguments]    ${testCaseID}
    upload result to testlink    ${testCaseID}
    Disconnect DUT And Controller


