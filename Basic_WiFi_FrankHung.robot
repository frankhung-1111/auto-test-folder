*** Settings ***
Resource    ../base.robot
Library    Selenium2Library
Library    OperatingSystem
#Test Teardown    print debug message to console
Force Tags    @Function=Somke_Test    @AUTHOR=Frank_Hung    @FEATURE=Function
Resource    ../../keyword/kw_Basic_WAN_FrankHung.robot
Resource    ../../keyword/kw_Basic_WiFi_FrankHung.robot
Resource    ../../keyword/kw_WB_Mode_WPS_FrankHung.robot
Resource    ../../keyword/kw_testlink_FrankHung.robot
Suite Setup    Up WAN Interface
#Suite Setup    Open Web GUI and Reboot Wifi_Client    ${URL}
#Suite Setup    Open Web GUI and Reset to Default    ${URL}    ${DUT_Password}
Suite Teardown    Up WAN Interface

*** Variables ***
${Channel_1}    1
${Channel_11}    11


*** Test Cases ***
#Reboot Wifi_Client
#    [Tags]    @AUTHOR=Frank_Hung
#    Reboot Wifi_Client_1 and Wifi_Client_2

#Detect GUI with Model Name
#    [Tags]
#    ${gui_type}     run keyword and return status    Page Should Contain Text    WSR-1166DHP
#    ${gui_type}    Convert to String    ${gui_type}
#    Should Contain    ${gui_type}    True

#Reboot from Consloe
#    [Tags]    @AUTHOR=Frank_Hung
#    Reboot DUT from Console

#Set ATS Server IP Address
#    [Tags]    @AUTHOR=Frank_Hung
#    Run    echo 'vagrant' | sudo -S ifconfig enp6s0 192.168.1.51 netmask 255.255.255.0

#Reset DUT using Console
#    [Tags]    @AUTHOR=Frank_Hung
#    Reset DUT from Console




#Add a Static route
#    [Tags]    @AUTHOR=Frank_Hung
#    Run    echo 'vagrant' | sudo -S dhclient ${ATS_to_DUT_Interface} -r
#    sleep    2
#    Run    echo 'vagrant' | sudo -S ip addr add 192.168.1.52/24 dev ${ATS_to_DUT_Interface}
#    sleep    2
#    Run    echo 'vagrant' | sudo -S ip route add 192.168.1.0/24 via 0.0.0.0 dev ${ATS_to_DUT_Interface}

Reset DUT
    [Tags]    @AUTHOR=Frank_Hung    p1Tag    testing2
#    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0
#    ${result}=    cli    DUT_serial_port    /opt/bin/restore_to_default.sh    prompt=#
#    sleep    240
    Login and Reset Default DUT        ${URL}    ${DUT_Password}
#    Run    python3 /home/vagrant/apc_script_power_off_to_on_port8.py
#    sleep    240
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} down
#    sleep    2
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} up
#    sleep    4
    Change WiFi 6GHz Channel to 1 from GUI
    Down Agent Interface
    Get DUT WAN IP

#    Login and Reset Default DUT        ${URL}    ${DUT_Password}


Create SSID Name for auto test
    [Tags]    @AUTHOR=Frank_Hung    testing2    p1Tag
    ${result}=    Generate Random String    4    [NUMBERS]


    ${ssid_2G_1}=    Catenate    SEPARATOR=    2G_0123456789    ${result}
    ${ssid_2G_2}=    Set Variable    2G_abcdefghijklmnopqrstuvwxyz
    ${ssid_2G_3}=    Set Variable    2G_ABCDEFGHIJKLMNOPQRSTUVWXYZ
    ${ssid_2G_4}=    Set Variable    ~!@#$%^&*()_+{}|:"<>?`-=[]\\;',./
    ${ssid_2G_5}=    Catenate    SEPARATOR=    2G_00000000000000000009azAZ#    ${result}
    ${ssid_common}=    Catenate    SEPARATOR=    common_    ${result}


    ${ssid_5G_1}=    Catenate    SEPARATOR=    5G_0123456789    ${result}
    ${ssid_5G_2}=    Set Variable    5G_abcdefghijklmnopqrstuvwxyz
    ${ssid_5G_3}=    Set Variable    5G_ABCDEFGHIJKLMNOPQRSTUVWXYZ
    ${ssid_5G_4}=    Set Variable    ~!@#$%^&*()_+{}|:"<>?`-=[]\\;',./
    ${ssid_5G_5}=    Catenate    SEPARATOR=    5G_00000000000000000009azAZ#    ${result}

    ${ssid_6G_1}=    Catenate    SEPARATOR=    6G_0123456789    ${result}
    ${ssid_6G_2}=    Set Variable    6G_abcdefghijklmnopqrstuvwxyz
    ${ssid_6G_3}=    Set Variable    6G_ABCDEFGHIJKLMNOPQRSTUVWXYZ
    ${ssid_6G_4}=    Set Variable    ~!@#$%^&*()_+{}|:"<>?`-=[]\\;',./
    ${ssid_6G_5}=    Catenate    SEPARATOR=    6G_00000000000000000009azAZ#    ${result}


    ${ssid_guest}=    Catenate    SEPARATOR=    ${result}    -guest

    Set Suite Variable    ${ssid_2G_1}    ${ssid_2G_1}
    Set Suite Variable    ${ssid_2G_2}    ${ssid_2G_2}
    Set Suite Variable    ${ssid_2G_3}    ${ssid_2G_3}
    Set Suite Variable    ${ssid_2G_4}    ${ssid_2G_4}
    Set Suite Variable    ${ssid_2G_5}    ${ssid_2G_5}
    Set Suite Variable    ${ssid_common}    ${ssid_common}
    Set Suite Variable    ${ssid_5G_1}    ${ssid_5G_1}
    Set Suite Variable    ${ssid_5G_2}    ${ssid_5G_2}
    Set Suite Variable    ${ssid_5G_3}    ${ssid_5G_3}
    Set Suite Variable    ${ssid_5G_4}    ${ssid_5G_4}
    Set Suite Variable    ${ssid_5G_5}    ${ssid_5G_5}
    Set Suite Variable    ${ssid_6G_1}    ${ssid_6G_1}
    Set Suite Variable    ${ssid_6G_2}    ${ssid_6G_2}
    Set Suite Variable    ${ssid_6G_3}    ${ssid_6G_3}
    Set Suite Variable    ${ssid_6G_4}    ${ssid_6G_4}
    Set Suite Variable    ${ssid_6G_5}    ${ssid_6G_5}
    Set Suite Variable    ${wifi_password}    ghijGHIJK/
    Set Suite Variable    ${wifi_password_special}    ~!@#$%^&*()_+{}|:"<>?`-=[]\\;',./
    Set Suite Variable    ${wifi_password_64}    111111111111111111111111111111111111111111111111111111111111111
    Set Suite Variable    ${wifi_password_63}    zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
    Set Suite Variable    ${ssid_guest}    ${ssid_guest}



Delete WiFi Profile and Reboot Wirless PC
     [Tags]    @AUTHOR=Frank_Hung    p1Tag
     Wait Until Keyword Succeeds    3x    2s    cli    wifi_client    echo '${DEVICES.wifi_client.password}' | sudo -S find /etc/NetworkManager/system-connections/ ! -name '${WirelessPC1_telnet_Profile}' ! -name 'l2tp-test-2.nmconnection' -type f -delete    prompt=gemtek@gemtek    timeout=30
     Wait Until Keyword Succeeds    3x    2s    cli    wifi_client    echo '${DEVICES.wifi_client.password}' | sudo -S /sbin/shutdown -r    prompt=scheduled    timeout=70
     sleep    60

Delete WiFi Profile and Reboot Wirless PC2
     [Tags]    @AUTHOR=Frank_Hung    p1Tag
     Wait Until Keyword Succeeds    3x    2s    cli    wifi_client2    echo '${DEVICES.wifi_client2.password}' | sudo -S find /etc/NetworkManager/system-connections/ ! -name '${WirelessPC2_telnet_Profile}' ! -name 'l2tp-test-2.nmconnection' -type f -delete    prompt=gemtek@gemtek    timeout=30
     Wait Until Keyword Succeeds    3x    2s    cli    wifi_client2    echo '${DEVICES.wifi_client2.password}' | sudo -S /sbin/shutdown -r    prompt=scheduled    timeout=70
     sleep    60

G-CPE-1 : Wireless default setting check
    [Tags]    @AUTHOR=Frank_Hung
    Verify Common SSID Enabled : ON and MLO Default is : disable
    Get DUT WAN IP
    [Teardown]    upload result to testlink    G-CPE-1

G-CPE-2 : 2G SSID default Value
    [Tags]    @AUTHOR=Frank_Hung    consoleTag    p1Tag    testing2
    Disable Common SSID on GUI
    Verify 2.4G SSID Default Value is Gemtek_Wifi7_2G_XXXXXX
    ${default_password}    Get Default WiFi Password
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_default}    ${default_password}
    [Teardown]    upload result to testlink    G-CPE-2



G-CPE-20 : 2G default Authentication check
    [Tags]    @AUTHOR=Frank_Hung    consoleTag    p1Tag
    Verify the 2.4G default Authentication setting should Be WPA3/WPA2 PSK
    [Teardown]    upload result to testlink    G-CPE-20

G-CPE-22 : 2G WPA Preshare key default Value check
    [Tags]    @AUTHOR=Frank_Hung    consoleTag    p1Tag
    ${default_password}    Get Default WiFi Password
    Verify WiFi 2.4GHz WPA Preshare key default Value    ${ssid_2G_default}    ${default_password}
    [Teardown]    upload result to testlink    G-CPE-22


G-CPE-21 : 2G security type WPA3/WPA2 PAK check
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"    ${ssid_2G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_2G_1}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-21




G-CPE-23 : 2G WPA Preshare key minimum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz Preshare key to 8 bit input and click "Save"    ${ssid_2G_1}    87654321
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    87654321
    [Teardown]    upload result to testlink    G-CPE-23



G-CPE-26 : 2G WPA Preshare key special format input check
    [Tags]    @AUTHOR=Frank_Hung
    Verify "1 345678" can input to 2.4G Password Field and click "Save"    ${ssid_2G_1}    1${SPACE}345678
    Verify Wireless PC can connect to DUT and access to Internet by WPA3        ${ssid_2G_1}    1${SPACE}345678
    [Teardown]    upload result to testlink    G-CPE-26




G-CPE-33 : 5G default Authentication check
    [Tags]    @AUTHOR=Frank_Hung    consoleTag    p1Tag
    Verify the 5G default Authentication setting should Be WPA3/WPA2 PSK
    [Teardown]    upload result to testlink    G-CPE-33




G-CPE-3 : 2G SSID minimum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to 1 bit input and click "Save"    1    12345678
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    1    12345678
    [Teardown]    upload result to testlink    G-CPE-3



G-CPE-4 : 2G SSID maximum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to 32 bit input and click "Save"    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa    12345678
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa    12345678
    [Teardown]    upload result to testlink    G-CPE-4



G-CPE-19 : 2G SSID wrong format Check
    [Tags]    @AUTHOR=Frank_Hung
    Open WLAN Basic Config Page
    Verify " 234" cannot input to 2.4G SSID Field
    Verify "1 34" can input to 2.4G SSID Field and click "Save"
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    1${SPACE}34    12345678
    [Teardown]    upload result to testlink    G-CPE-19



#G-CPE-202 : Check 2G Enable/Disable function
#    [Tags]    @AUTHOR=Frank_Hung
#    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"    ${ssid_2G_1}    ${wifi_password}
#    Disable WiFi 2.4GHz on GUI
#    Verify Wireless PC cannot connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password}
#    Reboot DUT frome Console
#    Verify Wireless PC cannot connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password}
#    Enable WiFi 2.4GHz on GUI
#    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password}





G-CPE-28 : 5G SSID default Value check
    [Tags]    @AUTHOR=Frank_Hung    consoleTag    p1Tag
    Disable Common SSID on GUI
    Verify 5G SSID Default Value is Gemtek_Wifi7_5G_XXXXXX
    ${default_password}    Get Default 5G WiFi Password
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G_default}    ${default_password}
    [Teardown]    upload result to testlink    G-CPE-28



G-CPE-35 : 5G WPA Preshare key default Value check
    [Tags]    @AUTHOR=Frank_Hung    consoleTag    p1Tag
    ${default_password}    Get Default 5G WiFi Password
    Verify WiFi 5GHz WPA Preshare key default Value    ${ssid_5G_default}    ${default_password}
    [Teardown]    upload result to testlink    G-CPE-35




G-CPE-29 : 5G SSID minimum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to 1 bit input and click "Save"    5    12345678
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    5    12345678
    [Teardown]    upload result to testlink    G-CPE-29


G-CPE-30 : 5G SSID maximum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to 32 bit input and click "Save"    zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz    12345678
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz    12345678
    [Teardown]    upload result to testlink    G-CPE-30


G-CPE-32 : 5G SSID wrong format Check
    [Tags]    @AUTHOR=Frank_Hung
    Open WLAN Basic Config Page
    Verify " 234" cannot input to 5G SSID Field
    Verify "1 34-5G" can input to 5G SSID Field and click "Save"
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    1${SPACE}34-5G    12345678
    [Teardown]    upload result to testlink    G-CPE-32

G-CPE-34 : 5G security type WPA3/WPA2 PAK check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz security type WPA3/WPA2 PAK and click "Save"    ${ssid_5G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_5G_1}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-34


G-CPE-36 : 5G WPA Preshare key minimum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz Preshare key to 8 bit input and click "Save"    ${ssid_5G_1}    87654321
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    87654321
    [Teardown]    upload result to testlink    G-CPE-36

G-CPE-37 : 5G WPA Preshare key maximum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz Preshare key to 63 bit input and click "Save"    ${ssid_5G_1}    ${wifi_password_63}
    [Teardown]    upload result to testlink    G-CPE-37

G-CPE-39 : 5G WPA Preshare key special format input check
    [Tags]    @AUTHOR=Frank_Hung
    Verify "1 345678" can input to 5G Password Field and click "Save"    ${ssid_5G_1}    1${SPACE}345678
    Verify Wireless PC can connect to DUT and access to Internet by WPA3        ${ssid_5G_1}    1${SPACE}345678
    [Teardown]    upload result to testlink    G-CPE-39

#G-CPE-203 : Check 5G Enable/Disable function
#    [Tags]    @AUTHOR=Frank_Hung
#    Change WiFi 5GHz SSID to "0123456789_5G_xxxx" and click "Save"    ${ssid_5G_1}    ${wifi_password}
#    Disable WiFi 5GHz on GUI
#    Verify Wireless PC cannot connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    ${wifi_password}
#    Reboot DUT frome Console
#    Verify Wireless PC cannot connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    ${wifi_password}
#    Enable WiFi 5GHz on GUI
#    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    ${wifi_password}

G-CPE-40-41 : 6G SSID default Value
    [Tags]    @AUTHOR=Frank_Hung    consoleTag    p1Tag
    Verify 6G SSID Default Value is Gemtek_Wifi7_6G_XXXXXX
    ${default_password}    Get Default 6G WiFi Password
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_6G_default}    ${default_password}
    [Teardown]    upload result to testlink for G-CPE-40-41     G-CPE-40    G-CPE-41

G-CPE-46 : 6G default Authentication check
    [Tags]    @AUTHOR=Frank_Hung    consoleTag    p1Tag
    Verify the 6G default Authentication setting should Be WPA3/WPA2 PSK
    [Teardown]    upload result to testlink    G-CPE-46

G-CPE-53 : Cancel Button Test
    [Tags]    @AUTHOR=Frank_Hung
    Set Any Value on GUI and Click Cancel Button, verify value cannot be saved
    [Teardown]    upload result to testlink    G-CPE-53

G-CPE-48 : 6G WPA Preshare key default Value check
    [Tags]    @AUTHOR=Frank_Hung    consoleTag    p1Tag
    ${default_password}    Get Default 6G WiFi Password
    Verify WiFi 6GHz WPA Preshare key default Value    ${ssid_6G_default}    ${default_password}
    [Teardown]    upload result to testlink    G-CPE-48

G-CPE-42 : 6G SSID minimum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 6GHz SSID to 1 bit input and click "Save"    6    12345678
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    6    12345678
    [Teardown]    upload result to testlink    G-CPE-42

G-CPE-43 : 6G SSID maximum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 6GHz SSID to 32 bit input and click "Save"    66666666666666666666666666666666    12345678
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    66666666666666666666666666666666    12345678
    [Teardown]    upload result to testlink    G-CPE-43

G-CPE-45 : 6G SSID wrong format Check
    [Tags]    @AUTHOR=Frank_Hung
    Open WLAN Basic Config Page
    Verify " 234" cannot input to 6G SSID Field
    Verify "1 34-6G" can input to 6G SSID Field and click "Save"
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    1${SPACE}34-6G    12345678
    [Teardown]    upload result to testlink    G-CPE-45


G-CPE-47 : 6G security type WPA3/WPA2 PAK check
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Change WiFi 6GHz security type WPA3/WPA2 PAK and click "Save"    ${ssid_6G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_6G_1}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-47


G-CPE-49 : 6G WPA Preshare key minimum input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 6GHz Preshare key to 8 bit input and click "Save"    ${ssid_6G_1}    87654321
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_6G_1}    87654321
    [Teardown]    upload result to testlink    G-CPE-49

G-CPE-52 : 6G WPA Preshare key special format input check
    [Tags]    @AUTHOR=Frank_Hung
    Verify "1 345678" can input to 6G Password Field and click "Save"    ${ssid_6G_1}    1${SPACE}345678
    Verify Wireless PC can connect to DUT and access to Internet by WPA3        ${ssid_6G_1}    1${SPACE}345678
    [Teardown]    upload result to testlink    G-CPE-52


G-CPE-55 : Common SSID function check
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Enable Common SSID, Config [SSID] [security type] and [Password] on GUI    ${ssid_common}    ${wifi_password_63}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_common}    ${wifi_password_63}
    [Teardown]    upload result to testlink    G-CPE-55

G-CPE-58 : 2.4 GHz Wireless Settings default Value check
    [Tags]    @AUTHOR=Frank_Hung
    Verify WiFi 2.4GHz Mode is 802.11be, Bandwith is 20 / 40 MHz and Channel is Auto on GUI
    [Teardown]    upload result to testlink    G-CPE-58

G-CPE-60 : 2.4 GHz Wireless Settings-Bandwidth Test
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz Bandwith to 40Mhz
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"    ${ssid_2G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password}
    Verify Bandwith on Wireless PC should be 40Mhz
    Change WiFi 2.4GHz Bandwith to 20Mhz
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password}
    Verify Bandwith on Wireless PC should be 20Mhz
    [Teardown]    upload result to testlink    G-CPE-60

#G-CPE-63 : 5 GHz Wireless Settings default Value check
#    [Tags]    @AUTHOR=Frank_Hung
#    Verify WiFi 5GHz Mode is 802.11be, Bandwith is 20 / 40 / 80 / 160 MHz and Channel is Auto on GUI

G-CPE-204 : Check 6G Enable/Disable function
    [Tags]    @AUTHOR=Frank_Hung    consoleTag
    Change WiFi 6GHz SSID to "0123456789_6G_xxxx" and click "Save"    ${ssid_6G_1}    ${wifi_password}
    Disable WiFi 6GHz on GUI
    Verify Wireless PC cannot connect to DUT and access to Internet by WPA3    ${ssid_6G_1}    ${wifi_password}
    Reboot DUT frome Console
    Verify Wireless PC cannot connect to DUT and access to Internet by WPA3    ${ssid_6G_1}    ${wifi_password}
    Enable WiFi 6GHz on GUI
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_6G_1}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-204


G-CPE-563 WiFi 2.4GHz SSID changed ---0 to 9
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"    ${ssid_2G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-563

G-CPE-564 WiFi 5GHz SSID changed ---0 to 9
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx" and click "Save"    ${ssid_5G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-564


Reset DUT
    [Tags]    @AUTHOR=Frank_Hung
#    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0
#    ${result}=    cli    DUT_serial_port    /opt/bin/restore_to_default.sh    prompt=#
#    sleep    240
    Login and Reset Default DUT        ${URL}    ${DUT_Password}
#    Run    python3 /home/vagrant/apc_script_power_off_to_on_port8.py
#    sleep    240
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} down
#    sleep    2
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} up
#    sleep    4
    Change WiFi 6GHz Channel to 1 from GUI


G-CPE-565 WiFi 6GHz SSID changed ---0 to 9
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    Change WiFi 6GHz SSID to "0123456789_6G_xxxx", Security to WPA3-PSK    ${ssid_6G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_6G_1}    ${wifi_password}
    Verify Wireless PC's Channel is 1
    [Teardown]    upload result to testlink    G-CPE-565


G-CPE-61 : 2.4 GHz Wireless Settings-Channel Test
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"    ${ssid_2G_1}    ${wifi_password}
    Change WiFi 2.4GHz Channel to 1
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password}
    Verify Wireless PC's Channel is 1
    Change WiFi 2.4GHz Channel to 11
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password}
    Verify Wireless PC's Channel is 11
    [Teardown]    upload result to testlink    G-CPE-61

G-CPE-79 : 5 GHz Wireless Settings-Channel Test
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx" and click "Save"    ${ssid_5G_1}    ${wifi_password}
    Change WiFi 5GHz Channel to 36
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    ${wifi_password}
    Verify Wireless PC's Channel is 36
    Change WiFi 5GHz Channel to 100
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    ${wifi_password}
    Verify Wireless PC's Channel is 100
    Change WiFi 5GHz Channel to 165
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    ${wifi_password}
    Verify Wireless PC's Channel is 165
    [Teardown]    upload result to testlink    G-CPE-79


G-CPE-566 WiFi 2.4GHz SSID changed --- lower case
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "abcdefghijklmnopqrstuvwxyz_2G_xxxx" and click "Save"    ${ssid_2G_2}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_2}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-566

G-CPE-567 WiFi 5GHz SSID changed --- lower case
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to "abcdefghijklmnopqrstuvwxyz_5G_xxxx" and click "Save"    ${ssid_5G_2}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3   ${ssid_5G_2}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-567

G-CPE-568 WiFi 6GHz SSID changed --- lower case
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 6GHz SSID to "abcdefghijklmnopqrstuvwxyz_6G_xxxx" and click "Save"    ${ssid_6G_2}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3   ${ssid_6G_2}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-568

G-CPE-569 2.4GHz SSID changed --- upper case
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to Uppercase letter"ABCDEFGHIJKLMNOPQRSTUVWXYZ_2G_xxxx" and click "Save"    ${ssid_2G_3}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_3}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-569

G-CPE-570 5GHz SSID changed --- upper case
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to Uppercase letter "ABCDEFGHIJKLMNOPQRSTUVWXYZ_5G_xxxx" and click "Save"    ${ssid_5G_3}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3   ${ssid_5G_3}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-570

G-CPE-571 6GHz SSID changed --- upper case
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 6GHz SSID to Uppercase letter "ABCDEFGHIJKLMNOPQRSTUVWXYZ_6G_xxxx" and click "Save"    ${ssid_6G_3}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3   ${ssid_6G_3}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-571

G-CPE-18 : 2G SSID Special string check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"    ${ssid_2G_4}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet for special char    ${ssid_2G_4}    wpa_supplicant_special_2G_ssid_wpa3.conf
    [Teardown]    upload result to testlink and Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"    ${ssid_2G_1}    ${wifi_password}    G-CPE-18

G-CPE-25 : 2G WPA Preshare key special string input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz Password to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"    2GHz_ssid    ${wifi_password_special}
    Verify Wireless PC can connect to DUT and access to Internet for special char Password    2GHz_ssid    wpa_supplicant_special_password_2G_pwa3.conf
    [Teardown]    upload result to testlink    G-CPE-25

Reset DUT
    [Tags]    @AUTHOR=Frank_Hung    regressionTag
    Login and Reset Default DUT        ${URL}    ${DUT_Password}
    Change WiFi 6GHz Channel to 1 from GUI

G-CPE-31 : 5G SSID Special string check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"    ${ssid_5G_4}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet for special char    ${ssid_5G_4}    wpa_supplicant_special_5G_ssid_wpa3.conf
    [Teardown]    upload result to testlink and Change WiFi 5GHz SSID to "0123456789_5G_xxxx" and click "Save"    ${ssid_5G_1}    ${wifi_password}    G-CPE-31

G-CPE-44 : 6G SSID Special string check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 6GHz SSID to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"    ${ssid_6G_4}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet for special char    ${ssid_6G_4}    wpa_supplicant_special_6G_ssid_wpa3.conf
    [Teardown]    upload result to testlink and Change WiFi 6GHz SSID to "0123456789_6G_xxxx", Security to WPA3-PSK    ${ssid_6G_1}    ${wifi_password_63}    G-CPE-44

G-CPE-38 : 5G WPA Preshare key special string input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz Password to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"    5GHz_ssid    ${wifi_password_special}
    Verify Wireless PC can connect to DUT and access to Internet for special char Password    5GHz_ssid    ./wpa_supplicant_special_password_5G_pwa3.conf
    [Teardown]    upload result to testlink    G-CPE-38

G-CPE-51 : 6G WPA Preshare key special string input check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 6GHz Password to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"    6GHz_ssid    ${wifi_password_special}
    Verify Wireless PC can connect to DUT and access to Internet for special char Password    6GHz_ssid    ./wpa_supplicant_special_password_6G_pwa3.conf
    [Teardown]    upload result to testlink    G-CPE-51


G-CPE-4 : 2G SSID maximum input check --- 32 char
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "00000000000000000009azAZ#_2G_xxxx" and click "Save"    ${ssid_2G_5}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_5}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-4

G-CPE-30 : 5G SSID maximum input check --- 32 char
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to "00000000000000000009azAZ#_5G_xxxx" and click "Save"    ${ssid_5G_5}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3   ${ssid_5G_5}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-30

G-CPE-43 : 6G SSID maximum input check --- 32 char
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 6GHz SSID to "00000000000000000009azAZ#_6G_xxxx" and click "Save"    ${ssid_6G_5}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3   ${ssid_6G_5}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-43

G-CPE-21 : 2G security type WPA3/WPA2 PAK check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx", Security to WPA3/WPA2-PSK    ${ssid_2G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_2G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3   ${ssid_2G_1}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-21

G-CPE-34 : 5G security type WPA3/WPA2 PAK check
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx", Security to WPA3/WPA2-PSK    ${ssid_5G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_5G_1}    ${wifi_password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    ${wifi_password}
    [Teardown]    upload result to testlink    G-CPE-34

G-CPE-572 : 2.4GHz WPA3-Personal (WPA3 PSK)
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx", Security to WPA3-PSK    ${ssid_2G_1}    ${wifi_password_64}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    ${wifi_password_64}
    [Teardown]    upload result to testlink    G-CPE-572

G-CPE-573 : 5GHz WPA3-Personal (WPA3 PSK)
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx", Security to WPA3-PSK    ${ssid_5G_1}    ${wifi_password_64}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3   ${ssid_5G_1}    ${wifi_password_64}
    [Teardown]    upload result to testlink    G-CPE-573

Delete WiFi Profile and Reboot Wirless PC
     [Tags]    @AUTHOR=Frank_Hung
     Wait Until Keyword Succeeds    3x    2s    cli    wifi_client    echo '${DEVICES.wifi_client.password}' | sudo -S find /etc/NetworkManager/system-connections/ ! -name 'Wired connection 1.nmconnection' ! -name 'l2tp-test-2.nmconnection' -type f -delete    prompt=gemtek@gemtek    timeout=30
     Wait Until Keyword Succeeds    3x    2s    cli    wifi_client    echo '${DEVICES.wifi_client.password}' | sudo -S /sbin/shutdown -r    prompt=scheduled    timeout=70
     sleep    60

Reset DUT
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
#    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0
#    ${result}=    cli    DUT_serial_port    /opt/bin/restore_to_default.sh    prompt=#
#    sleep    240
    Login and Reset Default DUT        ${URL}    ${DUT_Password}
#    Run    python3 /home/vagrant/apc_script_power_off_to_on_port8.py
#    sleep    240
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} down
#    sleep    2
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} up
#    sleep    4

G-CPE-574 : Verify with WPS Push button (Virtual Button)
    [Tags]    @AUTHOR=Frank_Hung    p1Tag
    #Enable WPS on DUT
#    Wait Until Keyword Succeeds    2x    60s    Retry WPS PBC    ${WPS_bssid_2G}    wifi_client
    Change Common SSID Security to WPA3/WPA2 PSK
    Wait Until Keyword Succeeds    2x    60s    Retry WPS PBC    ${WPS_bssid_5G}    wifi_client
    [Teardown]    upload result to testlink    G-CPE-574


G-CPE-575 : WPS function is disabled (Virtual Button)
    [Tags]    @AUTHOR=Frank_Hung
    Disable WPS on DUT
    Repeat keyword    2 times    Retry WPS PBC Should Fail    ${WPS_bssid_5G}    wifi_client
    [Teardown]    upload result to testlink    G-CPE-575

G-CPE-576 : WiFi 2.4GHz incorrect Preshare key
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"    ${ssid_2G_1}    ${wifi_password}
    Verify Wireless PC cannot connect to DUT and access to Internet by WPA3    ${ssid_2G_1}    incorrect_password
    [Teardown]    upload result to testlink    G-CPE-576

G-CPE-577 : WiFi 5GHz incorrect Peshare key
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx" and click "Save"    ${ssid_5G_1}    ${wifi_password}
    Verify Wireless PC cannot connect to DUT and access to Internet by WPA3    ${ssid_5G_1}    incorrect_password
    [Teardown]    upload result to testlink    G-CPE-577

G-CPE-578 : WiFi 6GHz incorrect Peshare key
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 6GHz SSID to "0123456789_6G_xxxx" and click "Save"    ${ssid_6G_1}    ${wifi_password}
    Verify Wireless PC cannot connect to DUT and access to Internet by WPA3    ${ssid_6G_1}    incorrect_password
    [Teardown]    upload result to testlink    G-CPE-578



G-CPE-579 : Setup a Mesh Network (Ethernet Onboarding)
    [Tags]    @AUTHOR=Frank_Hung    regressionTag    p1Tag    
    Enable Mesh from GUI
    Power OFF than Power ON Agent
    Up Agent Interface
    sleep    240
    Verify mesh topology from GUI, it should display Controller and Agent
    [Teardown]    upload result to testlink    G-CPE-579

G-CPE-580 : Check mesh network topology (Ethernet Onboarding)
    [Tags]    @AUTHOR=Frank_Hung    regressionTag    p1Tag    
    Verify mesh node(devices) in the mesh network
    Verify clients(users) in the mesh network
    [Teardown]    upload result to testlink and Down Agent Interface    G-CPE-580




#G-CPE-130 : Wireless Extender Basic function check (Need Confirm)
#    [Tags]    @AUTHOR=Frank_Hung    regressionTag    consoleTag    p1Tag
#    Change device to WiFi Extender Mode From GUI
#    After device reboot, the device will change IP to 192.168.100.100, the connected PC must change IP to 192.168.100.x
#    Verify the connected PC can open DUT GUI 192.168.100.100
#    Choose one SSID and input password and click Connect
#    Verify the page show Connected Status for connection
#    [Teardown]    upload result to testlink and Reset DUT and Wait 210 seconds    G-CPE-130






**** comments ****










Case. FN23WP004 Verify with Device PIN
    [Tags]    @AUTHOR=Frank_Hung
    Wait Until Keyword Succeeds    2x    10s    Retry WPS PIN on Client    wifi_client
    Wait Until Keyword Succeeds    2x    10s    Retry WPS PIN    ${WPS_bssid_5G}    ${WPS_PIN_Code}    wifi_client
    Wait Until Keyword Succeeds    2x    10s    Retry WPS PIN    ${WPS_bssid_2G}    ${WPS_PIN_Code}    wifi_client


Temp
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx", Security to WPA2-PSK    ${ssid_5G_1}    ${wifi_password_64}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_5G_1}    ${wifi_password_64}

Case. FN23WL002 Security is disabled (OPEN)
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx", Security to OPEN    ${ssid_2G_1}
    Verify Wireless PC can connect to DUT and access to Internet (OPEN)    ${ssid_2G_1}
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx", Security to OPEN    ${ssid_5G_1}
    Verify Wireless PC can connect to DUT and access to Internet (OPEN)    ${ssid_5G_1}

Case. FN23WL004 WPA2/WPA-Personal (WPA2/WPA PSK)
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx", Security to WPA2/WPA-PSK    ${ssid_2G_1}    ${wifi_password_63}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_2G_1}    ${wifi_password_63}
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx", Security to WPA2/WPA-PSK    ${ssid_5G_1}    ${wifi_password_63}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_5G_1}    ${wifi_password_63}

Case. FN23WL006 WPA3/WPA2-Personal (WPA3/WPA2 PSK)
    [Tags]    @AUTHOR=Frank_Hung
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"    ${ssid_2G_1}    ${wifi_password_63}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_2G_1}    ${wifi_password_63}
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx" and click "Save"    ${ssid_5G_1}    ${wifi_password_63}
    Verify Wireless PC can connect to DUT and access to Internet    ${ssid_5G_1}    ${wifi_password_63}

*** Keywords ***
upload result to testlink for G-CPE-40-41
    [Arguments]    ${testCaseID}    ${testCaseID2}
    upload result to testlink    ${testCaseID}
    upload result to testlink    ${testCaseID2}

upload result to testlink and Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"
    [Arguments]     ${ssid_2G_1}    ${wifi_password}    ${testCaseID}
    upload result to testlink    ${testCaseID}
    Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"    ${ssid_2G_1}    ${wifi_password}

upload result to testlink and Change WiFi 5GHz SSID to "0123456789_5G_xxxx" and click "Save"
    [Arguments]     ${ssid_5G_1}    ${wifi_password}    ${testCaseID}
    upload result to testlink    ${testCaseID}
    Change WiFi 5GHz SSID to "0123456789_5G_xxxx" and click "Save"    ${ssid_5G_1}    ${wifi_password}

upload result to testlink and Change WiFi 6GHz SSID to "0123456789_6G_xxxx", Security to WPA3-PSK
    [Arguments]     ${ssid_6G_1}    ${wifi_password_63}    ${testCaseID}
    upload result to testlink    ${testCaseID}
    Change WiFi 6GHz SSID to "0123456789_6G_xxxx", Security to WPA3-PSK    ${ssid_6G_1}    ${wifi_password_63}


upload result to testlink and Down Agent Interface
    [Arguments]    ${testCaseID}
    upload result to testlink    ${testCaseID}
    Down Agent Interface

upload result to testlink and Reset DUT and Wait 210 seconds
    [Arguments]    ${testCaseID}
    upload result to testlink    ${testCaseID}
    Reset DUT and Wait 210 seconds


****Keywords****
Change Common SSID Security to WPA3/WPA2 PSK
    Open WLAN Basic Config Page
    Select From List By Value    id=authtype_commong    mixed3
    sleep    1
    click element    id=apply
    sleep    180
    Close Browser

Get Default 6G WiFi Password
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0

    IF    ${Platform}=='SPF12'
        ${result}=    cli    DUT_serial_port    grep -A 20 "option device 'wifi2'" /etc/config/wireless | grep "sae_password" | head -n1 | awk -F"'" '{print $2}'    prompt=root@
        ${result}=    Get Line    ${result}    3
        ${result}=    Strip String    ${result}
    ELSE IF    ${Platform}=='SPF13'
        ${result}=    cli    DUT_serial_port    cat /mnt/data/config/mfg | grep default_wifi_pw    prompt=root@
        #${result}=    Get Line    ${result}    1
        ${result}=    Get Regexp Matches    ${result}    (?<=')[^']+(?=')
        ${result}=    Strip String    ${result}[0]
    END

    [Return]    ${result}


Get Default 5G WiFi Password
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0

    IF    ${Platform}=='SPF12'
        ${result}=    cli    DUT_serial_port    grep -A 20 "option device 'wifi1'" /etc/config/wireless | grep "sae_password" | head -n1 | awk -F"'" '{print $2}'    prompt=root@
        ${result}=    Get Line    ${result}    3
        ${result}=    Strip String    ${result}
    ELSE IF    ${Platform}=='SPF13'
        ${result}=    cli    DUT_serial_port    cat /mnt/data/config/mfg | grep default_wifi_pw    prompt=root@
        #${result}=    Get Line    ${result}    1
        ${result}=    Get Regexp Matches    ${result}    (?<=')[^']+(?=')
        ${result}=    Strip String    ${result}[0]
    END

    [Return]    ${result}

Get Default WiFi Password
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0

    IF    ${Platform}=='SPF12'
        ${result}=    cli    DUT_serial_port    grep -A 20 "option device 'wifi0'" /etc/config/wireless | grep "sae_password" | head -n1 | awk -F"'" '{print $2}'    prompt=root@
        ${result}=    Get Line    ${result}    3
        ${result}=    Strip String    ${result}
    ELSE IF    ${Platform}=='SPF13'
        ${result}=    cli    DUT_serial_port    cat /mnt/data/config/mfg | grep default_wifi_pw    prompt=root@
        #${result}=    Get Line    ${result}    1
        ${result}=    Get Regexp Matches    ${result}    (?<=')[^']+(?=')
        ${result}=    Strip String    ${result}[0]
    END

    [Return]    ${result}

Verify Bandwith on Wireless PC should be 20Mhz
    ${result}=    cli    wifi_client    iw dev ${DEVICES.wifi_client.interface} info    prompt=gemtek@gemtek
    Should Contain    ${result}    width: 20 MHz

Verify Bandwith on Wireless PC should be 40Mhz
    ${result}=    cli    wifi_client    iw dev ${DEVICES.wifi_client.interface} info    prompt=gemtek@gemtek
    Should Contain    ${result}    width: 40 MHz

Change WiFi 2.4GHz Bandwith to 20Mhz
    Open WLAN Basic Config Page
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    Select From List By Value    id=wifi_bw_select2    20only
    sleep    1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Click Element    id=apply
    sleep    180
    Close Browser

Change WiFi 2.4GHz Bandwith to 40Mhz
    Open WLAN Basic Config Page
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    Select From List By Value    id=wifi_bw_select2    40only
    sleep    1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Click Element    id=apply
    sleep    180
    Close Browser

Verify WiFi 5GHz Mode is 802.11be, Bandwith is 20 / 40 / 80 / 160 MHz and Channel is Auto on GUI
    Open WLAN Basic Config Page
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    ${mode}=    Get Selected List Label    id=wifi_mode_select5
    log    ${mode}
    Should Be Equal    ${mode}    802.11 be
    ${bandwith}=    Get Selected List Label    id=wifi_bw_select5
    log    ${bandwith}
    Should Be Equal    ${bandwith}    20 / 40 / 80 / 160 MHz
    ${channel}=    Get Selected List Label    id=wifi_channel_select5
    log    ${channel}
    Should Be Equal    ${channel}    Auto
    Close Browser

Verify WiFi 2.4GHz Mode is 802.11be, Bandwith is 20 / 40 MHz and Channel is Auto on GUI
    Open WLAN Basic Config Page
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    ${mode}=    Get Selected List Label    id=wifi_mode_select2
    log    ${mode}
    Should Be Equal    ${mode}    802.11 be
    ${bandwith}=    Get Selected List Label    id=wifi_bw_select2
    log    ${bandwith}
    Should Be Equal    ${bandwith}    20 / 40 MHz
    ${channel}=    Get Selected List Label    id=wifi_channel_select2
    log    ${channel}
    Should Be Equal    ${channel}    Auto
    Close Browser


Enable Common SSID, Config [SSID] [security type] and [Password] on GUI
    [Arguments]    ${ssid}    ${password}
    Open WLAN Basic Config Page
    Enable Common SSID
    Input Text    id=commong_ssid    ${ssid}
    sleep    1
    Input Text    id=commong_wpa_key    ${password}
    sleep    1
    Click Element    id=apply
    sleep    180
    Close Browser


Set Any Value on GUI and Click Cancel Button, verify value cannot be saved
    Open WLAN Basic Config Page
    ${security_type}=    Get Selected List Label    id=authtype_2g
    log    ${security_type}
    Change WiFi 2.4GHz Security to    mixed3
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Click Element    id=cancel
    sleep    2
    ${security}=    Get Selected List Label    id=authtype_2g
    log    ${security}
    Should Not Be Equal    ${security}    WPA3/WPA2 PSK
    Close Browser


Power OFF than Power ON Agent
    Run    python3 /home/vagrant/apc_script_power_off_to_on_port4.py
    sleep    180

Verify Common SSID Enabled : ON and MLO Default is : disable
    Open WLAN Basic Config Page
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_single_ssid_enable    class
    log    ${enable_or_disable}
    Should Be Equal    ${enable_or_disable}    switch hidden-dom-removal checked

    ${enable_or_disable}=    get_element_attribute    id=switch_layout_MLO_enable    class
    log    ${enable_or_disable}
    Should Be Equal    ${enable_or_disable}    switch hidden-dom-removal

Reboot DUT frome Console
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0
    ${result}=    cli    DUT_serial_port    reboot    prompt=Restarting
    log    ${result}
    sleep    240
#    Run    python3 /home/vagrant/apc_script_power_off_to_on_port8.py
#    sleep    240
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} down
#    sleep    2
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} up
#    sleep    4

Disable WiFi 6GHz on GUI
    Open WLAN Basic Config Page
    Disable WiFi 6GHz
    click element    id=btn_apply
    sleep    2
    Click Element    id=confirm_dialog_confirmed
    sleep    240
    Close Browser

Disable WiFi 5GHz on GUI
    Open WLAN Basic Config Page
    Disable WiFi 5GHz
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=btn_apply
    sleep    2
    Click Element    id=confirm_dialog_confirmed
    sleep    240
    Close Browser

Enable WiFi 6GHz on GUI
    Open WLAN Basic Config Page
    Enable WiFi 6GHz
    Click Save Button on WLAN Basic Config Page


Enable WiFi 5GHz on GUI
    Open WLAN Basic Config Page
    Enable WiFi 5GHz
    Click Save Button on WLAN Basic Config Page

Disable WiFi 6GHz
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_SSID_enable6    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal checked'    click element    id=switch_layout_SSID_enable6
    sleep    2

Enable WiFi 6GHz
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_SSID_enable6    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_SSID_enable6
    sleep    2


Enable WiFi 5GHz
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_SSID_enable5    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_SSID_enable5
    sleep    2


Disable WiFi 5GHz
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_SSID_enable5    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal checked'    click element    id=switch_layout_SSID_enable5
    sleep    2


Enable WiFi 2.4GHz on GUI
    Open WLAN Basic Config Page
    Enable WiFi 2.4GHz
    Click Save Button on WLAN Basic Config Page

Enable WiFi 2.4GHz
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_SSID_enable2    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_SSID_enable2
    sleep    2

Disable WiFi 2.4GHz
    Click Element    id=tab_wifi_adv_allinone
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_SSID_enable2    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal checked'    click element    id=switch_layout_SSID_enable2
    sleep    2


Disable WiFi 2.4GHz on GUI
    Open WLAN Basic Config Page
    Disable WiFi 2.4GHz
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=btn_apply
    sleep    2
    Click Element    id=confirm_dialog_confirmed
    sleep    240
    Close Browser

Verify "1 345678" can input to 6G Password Field and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Verify "1 345678" can input to 5G Password Field and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Verify "1 345678" can input to 2.4G Password Field and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz Preshare key to 63 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz Preshare key to 8 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz Preshare key to 8 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz Preshare key to 8 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Verify WiFi 6GHz WPA Preshare key default Value
    [Arguments]    ${ssid_name}    ${password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_name}    ${password}

Verify WiFi 5GHz WPA Preshare key default Value
    [Arguments]    ${ssid_name}    ${password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_name}    ${password}

Verify WiFi 2.4GHz WPA Preshare key default Value
    [Arguments]    ${ssid_name}    ${password}
    Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid_name}    ${password}

Verify the 6G default Authentication setting should Be WPA3/WPA2 PSK
    Open WLAN Basic Config Page
    Disable Common SSID
    ${type}=    Get Selected List Label    id=authtype_6g

    IF    ${Platform}=='SPF12'
        Should Be Equal    ${type}    WPA3/WPA2 PSK
    ELSE IF    ${Platform}=='SPF13'
        Should Be Equal    ${type}    WPA3 PSK
    END
    sleep    1
    Close Browser


Verify the 5G default Authentication setting should Be WPA3/WPA2 PSK
    Open WLAN Basic Config Page
    Disable Common SSID
    ${type}=    Get Selected List Label    id=authtype_5g
    IF    ${Platform}=='SPF12'
        Should Be Equal    ${type}    WPA3/WPA2 PSK
    ELSE IF    ${Platform}=='SPF13'
        Should Be Equal    ${type}    WPA3/WPA2 PSK
    END
    sleep    2
    Close Browser

Verify the 2.4G default Authentication setting should Be WPA3/WPA2 PSK
    Open WLAN Basic Config Page
    Disable Common SSID
    ${type}=    Get Selected List Label    id=authtype_2g
    IF    ${Platform}=='SPF12'
        Should Be Equal    ${type}    WPA3/WPA2 PSK
    ELSE IF    ${Platform}=='SPF13'
        Should Be Equal    ${type}    WPA3/WPA2 PSK
    END
    sleep    2
    Close Browser

Verify "1 34-6G" can input to 6G SSID Field and click "Save"
    Change WiFi 6GHz SSID Name to    1${SPACE}34-6G
    Click Save Button on WLAN Basic Config Page

Verify "1 34-5G" can input to 5G SSID Field and click "Save"
    Change WiFi 5GHz SSID Name to    1${SPACE}34-5G
    Click Save Button on WLAN Basic Config Page

Verify "1 34" can input to 2.4G SSID Field and click "Save"
    Change WiFi 2.4GHz SSID Name to    1${SPACE}34
    Click Save Button on WLAN Basic Config Page

Verify " 234" cannot input to 6G SSID Field
    Change WiFi 6GHz SSID Name to    ${SPACE}234
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=btn_apply
    sleep    2
    ${message}=    Get Text    id=page_warning_msg
    Should Contain    ${message}    SSID should not begin or end with a space

Verify " 234" cannot input to 5G SSID Field
    Change WiFi 5GHz SSID Name to    ${SPACE}234
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=btn_apply
    sleep    2
    ${message}=    Get Text    id=page_warning_msg
    Should Contain    ${message}    SSID should not begin or end with a space

Verify " 234" cannot input to 2.4G SSID Field
    Change WiFi 2.4GHz SSID Name to    ${SPACE}234
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=btn_apply
    sleep    2
    ${message}=    Get Text    id=page_warning_msg
    Should Contain    ${message}    SSID should not begin or end with a space

Change WiFi 6GHz SSID to 32 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    wpa3
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz SSID to 32 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    wpa3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz SSID to 32 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    wpa3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz SSID to 1 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    wpa3
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz SSID to 1 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    wpa3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz SSID to 1 bit input and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    wpa3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page



Disable Common SSID on GUI
    Open WLAN Basic Config Page
    Disable Common SSID
    sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=apply
    sleep    120
    Close Browser

Verify 6G SSID Default Value is Gemtek_Wifi7_6G_XXXXXX
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0

    IF    ${Platform}=='SPF12'
        ${result}=    cli    DUT_serial_port    iwconfig ath2 | grep ESSID    prompt=root@
    ELSE IF    ${Platform}=='SPF13'
        ${result}=    cli    DUT_serial_port    cat /mnt/data/config/mfg | grep 'option default_wifi_ap_ssid'    prompt=root@
    END

    log    ${result}

    IF    '${Product_Name}'=='WREQ-130BE'
        Should Contain    ${result}    Gemtek_Wifi7_
    ELSE IF    '${Product_Name}'=='WNRFQQ-113BE'
        Should Contain    ${result}    Gemtek_Wi-Fi7_
    END

    IF    '${Product_Name}'=='WREQ-130BE'
        @{ssid}=    Get Regexp Matches    ${result}    Gemtek_Wifi7_\.\.\.\.\.\.
    ELSE IF    '${Product_Name}'=='WNRFQQ-113BE'
        @{ssid}=    Get Regexp Matches    ${result}    Gemtek_Wi-Fi7_\.\.\.\.\.\.
    END

    #@{ssid}=    Get Regexp Matches    ${result}    ESSID:"([^"]+)"    1
    ${ssid}=    Strip String    ${ssid}[0]
    log    ${ssid}
    Set Suite Variable    ${ssid_6G_default}    ${ssid}


Verify 5G SSID Default Value is Gemtek_Wifi7_5G_XXXXXX
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0

    IF    ${Platform}=='SPF12'
        ${result}=    cli    DUT_serial_port    iwconfig ath1 | grep ESSID    prompt=root@
    ELSE IF    ${Platform}=='SPF13'
        ${result}=    cli    DUT_serial_port    cat /mnt/data/config/mfg | grep 'option default_wifi_ap_ssid'    prompt=root@
    END

    log    ${result}

    IF    '${Product_Name}'=='WREQ-130BE'
        Should Contain    ${result}    Gemtek_Wifi7_
    ELSE IF    '${Product_Name}'=='WNRFQQ-113BE'
        Should Contain    ${result}    Gemtek_Wi-Fi7_
    END

    IF    '${Product_Name}'=='WREQ-130BE'
        @{ssid}=    Get Regexp Matches    ${result}    Gemtek_Wifi7_\.\.\.\.\.\.
    ELSE IF    '${Product_Name}'=='WNRFQQ-113BE'
        @{ssid}=    Get Regexp Matches    ${result}    Gemtek_Wi-Fi7_\.\.\.\.\.\.
    END

    #@{ssid}=    Get Regexp Matches    ${result}    ESSID:"([^"]+)"    1
    ${ssid}=    Strip String    ${ssid}[0]
    log    ${ssid}
    Set Suite Variable    ${ssid_5G_default}    ${ssid}


Verify 2.4G SSID Default Value is Gemtek_Wifi7_2G_XXXXXX
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0

    IF    ${Platform}=='SPF12'
        ${result}=    cli    DUT_serial_port    iwconfig ath1 | grep ESSID    prompt=root@
    ELSE IF    ${Platform}=='SPF13'
        ${result}=    cli    DUT_serial_port    cat /mnt/data/config/mfg | grep 'option default_wifi_ap_ssid'    prompt=root@
    END

    log    ${result}

    IF    '${Product_Name}'=='WREQ-130BE'
        Should Contain    ${result}    Gemtek_Wifi7_
    ELSE IF    '${Product_Name}'=='WNRFQQ-113BE'
        Should Contain    ${result}    Gemtek_Wi-Fi7_
    END

    IF    '${Product_Name}'=='WREQ-130BE'
        @{ssid}=    Get Regexp Matches    ${result}    Gemtek_Wifi7_\.\.\.\.\.\.
    ELSE IF    '${Product_Name}'=='WNRFQQ-113BE'
        @{ssid}=    Get Regexp Matches    ${result}    Gemtek_Wi-Fi7_\.\.\.\.\.\.
    END

    #@{ssid}=    Get Regexp Matches    ${result}    ESSID:"([^"]+)"    1
    ${ssid}=    Strip String    ${ssid}[0]
    log    ${ssid}
    Set Suite Variable    ${ssid_2G_default}    ${ssid}




Verify clients(users) in the mesh network
    ${result}=    Get Text    xpath=//*[@id="Device_topology_table_id_0"]/td[1]
    Should Contain Any    ${result}    lanhost    IT    Unknown
    ${result}=    Get Text    xpath=//*[@id="Device_topology_table_id_1"]/td[1]
    Should Contain Any    ${result}    IT    lanhost    Unknown
    #${result}=    Get Text    xpath=//*[@id="Device_topology_table_id_2"]/td[1]
    #Should Contain Any    ${result}    IT    lanhost    Unknown
    Close Browser


Verify mesh node(devices) in the mesh network
    ${result}=    Get Text    xpath=//*[@id="Mesh_topology_table_id_0"]/td[7]
    Should Be Equal    ${result}    Controller
    ${result}=    Get Text    xpath=//*[@id="Mesh_topology_table_id_1"]/td[7]
    Should Be Equal    ${result}    Agent
    sleep    2

Open Mesh information Page
    Click Element    id=lang_mainmenu_status
    sleep    2
    Click Element    id=lang_submenu_status_wifiMesh
    sleep    10

Verify mesh topology from GUI, it should display Controller and Agent
    Wait Until Keyword Succeeds    3x    10s    retry Verify mesh topology from GUI, it should display Controller and Agent

retry Verify mesh topology from GUI, it should display Controller and Agent
    Login GUI    ${URL}    ${DUT_Password}
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
    


Reset DUT and Wait 210 seconds
    [Tags]    @AUTHOR=Frank_Hung
    Up WAN Interface
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0
    ${result}=    cli    DUT_serial_port    /opt/bin/restore_to_default.sh    prompt=#
    sleep    240
#    Run    python3 /home/vagrant/apc_script_power_off_to_on_port8.py
#    sleep    240
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} down
#    sleep    2
#    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} up
#    sleep    4
    Run    echo 'vagrant' | sudo -S netplan apply
    sleep    6
    ${result}=    Run    ping -c 8 192.168.1.1
    Should Contain    ${result}    ttl=


Verify the page show Connected Status for connection
    open browser    ${URL_Extender}    Firefox
    sleep    3
    Maximize Browser Window
    sleep    3
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    Wait until element is visible    id=lang_mainmenu_basic_setting    timeout=30
    sleep    3
    Wait Until Element Is Not Visible    id=ajaxLoaderIcon    timeout=120
    sleep    2

    click element    id=lang_mainmenu_basic_setting
    sleep    2
    click element    id=lang_submenu_basic_setting_wlan
    sleep    2
    Wait until element is visible    id=switch_layout_single_ssid_enable
    sleep    1
    Click Element    id=tab_wireless_connection
    sleep    4
    ${ssid}=     Get Text    xpath=//*[@id="ext_currentConn_id_1"]/td[2]
    Should Be Equal    ${ssid}    Connected
    ${ssid}=     Get Text    xpath=//*[@id="ext_currentConn_id_1"]/td[3]
    Should Be Equal    ${ssid}    \#5G-20240530
    sleep    2
    Close Browser

Choose one SSID and input password and click Connect
    click element    id=lang_mainmenu_basic_setting
    sleep    2
    click element    id=lang_submenu_basic_setting_wlan
    sleep    2
    Wait until element is visible    id=switch_layout_single_ssid_enable
    sleep    1
    Click Element    id=tab_wireless_connection
    sleep    10
    Click Element    xpath=//*[@id="tb_scan_list"]/div[1]/a
    sleep    80
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Click Element    xpath=//*[@id="scan_list_id_manually"]/td[2]/button/img
    sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Input Text    id=wireless_extend_ssid    \#5G-20240530
    sleep    2
    Input Text    id=wireless_extend_password    12345678
    sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Click Element    xpath=//*[@class="gemtek-btn-primary"]
    sleep    240
    Close Browser

Verify the connected PC can open DUT GUI 192.168.100.100
    open browser    ${URL_Extender}    Firefox
    sleep    3
    Maximize Browser Window
    sleep    3
    wait_until_element_is_visible    id=acnt_passwd    timeout=90
    input_text    id=acnt_username    admin
    sleep    1
    input_text    id=acnt_passwd    ${DUT_Password}
    sleep    1
    click element    id=myButton
    sleep    5
    Wait until element is visible    id=lang_mainmenu_basic_setting    timeout=30
    sleep    3
    Wait Until Element Is Not Visible    id=ajaxLoaderIcon    timeout=120
    sleep    2






After device reboot, the device will change IP to 192.168.100.100, the connected PC must change IP to 192.168.100.x
    Run    echo 'vagrant' | sudo -S ifconfig ${ATS_to_DUT_Interface} 192.168.100.111
    sleep    2
    Run    echo 'vagrant' | sudo -S ip route add 192.168.100.0/24 via 0.0.0.0 dev ${ATS_to_DUT_Interface}
    ${result}=    Run    ping -c 8 192.168.100.100
    Should Contain    ${result}    ttl=

Enable Extender Mode on GUI
    Click Element    id=tab_wireless_connection
    sleep    4
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_extender_enable    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_extender_enable
    sleep    2
    Handle Alert
    Down WAN Interface
    sleep    240
    Close Browser

Change device to WiFi Extender Mode From GUI
    Open WLAN Basic Config Page
    Enable Extender Mode on GUI

Verify Wireless PC displays the connected Bandwith is 20MHz
    ${result}=    cli    wifi_client    iw dev ${DEVICES.wifi_client.interface} info    prompt=gemtek@gemtek
    Should Contain    ${result}    width: 20 MHz


Verify Wireless PC displays the connected Bandwith is 80MHz
    ${result}=    cli    wifi_client    iw dev ${DEVICES.wifi_client.interface} info    prompt=gemtek@gemtek
    Should Contain    ${result}    width: 80 MHz

Change WiFi 6GHz bandwith to 20/40/80MHz
    Open WLAN Basic Config Page
    Disable Common SSID
    click element    id=tab_wifi_adv_allinone
    sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Select From List By Value    id=wifi_bw_select6    204080
    sleep    1
    click element    id=apply
    sleep    120
    Close Browser


Change WiFi 5GHz bandwith to 20MHz
    Open WLAN Basic Config Page
    Disable Common SSID
    click element    id=tab_wifi_adv_allinone
    sleep    2
    Select From List By Value    id=wifi_bw_select5    20only
    sleep    1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=apply
    sleep    60
    Close Browser


Change WiFi 2.4GHz Channel to 11
    Open WLAN Basic Config Page
    Disable Common SSID
    click element    id=tab_wifi_adv_allinone
    sleep    2
    Select From List By Value    id=wifi_channel_select2    11
    sleep    1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=apply
    sleep    60
    Close Browser

Change WiFi 5GHz Channel to 165
    Open WLAN Basic Config Page
    Disable Common SSID
    click element    id=tab_wifi_adv_allinone
    sleep    2
    Select From List By Value    id=wifi_channel_select5    165
    sleep    1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=apply
    sleep    60
    Close Browser

Change WiFi 5GHz Channel to 100
    Open WLAN Basic Config Page
    Disable Common SSID
    click element    id=tab_wifi_adv_allinone
    sleep    2
    Select From List By Value    id=wifi_channel_select5    100
    sleep    1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=apply
    sleep    60
    Close Browser


Change WiFi 5GHz Channel to 36
    Open WLAN Basic Config Page
    Disable Common SSID
    click element    id=tab_wifi_adv_allinone
    sleep    2
    Select From List By Value    id=wifi_channel_select5    36
    sleep    1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=apply
    sleep    60
    Close Browser

Change WiFi 2.4GHz Channel to 1
    Open WLAN Basic Config Page
    Disable Common SSID
    click element    id=tab_wifi_adv_allinone
    sleep    2
    Select From List By Value    id=wifi_channel_select2    1
    sleep    1
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=apply
    sleep    60
    Close Browser

Verify Wireless PC's Channel is 36
    ${result}=    cli    wifi_client    iw dev ${DEVICES.wifi_client.interface} info    prompt=gemtek@gemtek
    Should Contain    ${result}    channel 36

Verify Wireless PC's Channel is 100
    ${result}=    cli    wifi_client    iw dev ${DEVICES.wifi_client.interface} info    prompt=gemtek@gemtek
    Should Contain    ${result}    channel 100

Verify Wireless PC's Channel is 165
    ${result}=    cli    wifi_client    iw dev ${DEVICES.wifi_client.interface} info    prompt=gemtek@gemtek
    Should Contain    ${result}    channel 165


Verify Wireless PC's Channel is 11
    ${result}=    cli    wifi_client    iw dev ${DEVICES.wifi_client.interface} info    prompt=gemtek@gemtek
    Should Contain    ${result}    channel 11

Verify Wireless PC's Channel is 1
    ${result}=    cli    wifi_client    iw dev ${DEVICES.wifi_client.interface} info    prompt=gemtek@gemtek
    Should Contain    ${result}    channel 1

Scan Channel Successful
    [Arguments]    ${device}    ${Channel}    ${ssid}
    cli    ${device}    rm temp
    sleep    4
    cli    ${device}    echo ${DEVICES.${device}.password} | sudo -S sudo nmcli device wifi rescan
    sleep    4
    cli    ${device}    echo ${DEVICES.${device}.password} | sudo -S sudo nmcli device wifi list > temp
    sleep    4
    ${result}=    cli    ${device}    cat temp | grep ${ssid}
    log    ${result}
    Should Contain    ${result}    ${Channel}
    cli    ${device}    rm temp

Setting DUT WiFi interface MAC from console
    Run    echo "vagrant" | sudo -S chmod 777 /dev/ttyUSB0
    cli    DUT_serial_port    uci set wireless.wifi0.macaddr='${WPS_bssid_2G}' && uci commit && wifi    prompt=#
    sleep    240
    cli    DUT_serial_port    uci set wireless.wifi1.macaddr='${WPS_bssid_5G}' && uci commit && wifi    prompt=#
    sleep    240

Verify Wireless PC can connect to DUT and access to Internet for special char Password
    [Arguments]    ${ssid}    ${config_file}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    Wait Until Keyword Succeeds    3x    10s    Retry Verify Wireless PC can connect to DUT and access to Internet for special char Password    ${ssid}    ${config_file}    ${device}    ${wifi_client_interface}    ${dut_gw}

Retry Verify Wireless PC can connect to DUT and access to Internet for special char Password
    [Arguments]    ${ssid}    ${config_file}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    [Documentation]    Connect to DUT with matched security key
    [Tags]    @AUTHOR=Frank_Hung
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl stop NetworkManager    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_supplicant -B -i ${DEVICES.wifi_client.interface} -c /etc/wpa_supplicant/${config_file}    prompt=gemtek@gemtek
    sleep    30
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    Should Not Contain    ${result}    off/any
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface} -r&    prompt=gemtek@gemtek
    sleep    4
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface}&    prompt=gemtek@gemtek
    sleep    60
    ${result}=    cli    ${device}    ifconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    log    ${result}
    ${result}=    cli    ${device}    ping -c 8 www.gemteks.com    prompt=gemtek@gemtek
    Should Contain    ${result}    ttl=
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek


Verify Wireless PC can connect to DUT and access to Internet for special char
    [Arguments]    ${ssid}    ${config_file}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    Wait Until Keyword Succeeds    3x    10s    Retry Verify Wireless PC can connect to DUT and access to Internet for special char    ${ssid}    ${config_file}    ${device}    ${wifi_client_interface}    ${dut_gw}

Retry Verify Wireless PC can connect to DUT and access to Internet for special char
    [Arguments]    ${ssid}    ${config_file}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    [Documentation]    Connect to DUT with matched security key
    [Tags]    @AUTHOR=Frank_Hung
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl stop NetworkManager    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_supplicant -B -i ${DEVICES.wifi_client.interface} -c /etc/wpa_supplicant/${config_file}    prompt=gemtek@gemtek
    sleep    30
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    Should Not Contain    ${result}    off/any
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface} -r&    prompt=gemtek@gemtek
    sleep    4
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface}&    prompt=gemtek@gemtek
    sleep    60
    ${result}=    cli    ${device}    ifconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    log    ${result}
    ${result}=    cli    ${device}    ping -c 8 www.gemteks.com    prompt=gemtek@gemtek
    Should Contain    ${result}    ttl=
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek

Is WIFI Interface Up
    [Arguments]    ${device}    ${ssid}
    [Documentation]    To check if wifi interface is up
    [Tags]    @AUTHOR=Gemtek_Gavin_Chang
    sleep    3
    #${result} =    cli    ${device}    ifconfig
    ${result} =    cli    ${device}    iwconfig
    Should Contain    ${result}    ${ssid}

Enable WPS on DUT
    Login GUI    ${URL}    ${DUT_Password}
    click element    id=lang_mainmenu_basic_setting
    sleep    2
    click element    id=lang_submenu_basic_setting_wlan
    sleep    2
    click element    id=tab_wifi_wps
    sleep    2
    Wait until element is visible    id=btn_pbc
    sleep    1
    ${enable_or_disable}=    get_element_attribute    xpath=//*[@id="switch_layout_btn"]    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    xpath=//*[@id="switch_layout_btn"]
    sleep    2
    #click element    xpath=//*[@class="el-button el-button--primary el-button--mini"]
    sleep    60
    Close Browser

Disable WPS on DUT
    Login GUI    ${URL}    ${DUT_Password}
    click element    id=lang_mainmenu_basic_setting
    sleep    2
    click element    id=lang_submenu_basic_setting_wlan
    sleep    2
    click element    id=tab_wifi_wps
    sleep    2
    Wait until element is visible    id=btn_pbc
    sleep    1
    ${enable_or_disable}=    get_element_attribute    xpath=//*[@id="switch_layout_btn"]    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal checked'    click element    xpath=//*[@id="switch_layout_btn"]
    sleep    2
    #click element    xpath=//*[@class="el-button el-button--primary el-button--mini"]
    sleep    60
    Close Browser



Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx", Security to WPA3-PSK
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    wpa3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz SSID to "0123456789_6G_xxxx", Security to WPA3-PSK
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    wpa3
    Change WiFi 6GHz Password to    ${password}

    Click Save Button on WLAN Basic Config Page

Enable Common SSID
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_single_ssid_enable    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_single_ssid_enable
    sleep    2


Disable Common SSID
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_single_ssid_enable    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal checked'    click element    id=switch_layout_single_ssid_enable
    sleep    2

Change WiFi 6GHz Channel to 1 from GUI
    Open WLAN Basic Config Page
    Change WiFi 6GHz Channel to 1
    click element    id=apply
    sleep    60
    close Browser


Change WiFi 6GHz Channel to 1
    click element    id=tab_wifi_adv_allinone
    sleep    2
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Select From List By Value    id=wifi_channel_select6    1
    sleep    1

Change WiFi 5GHz SSID to "0123456789_5G_xxxx", Security to WPA3-PSK
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    wpa3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz SSID to "0123456789_5G_xxxx", Security to WPA2/WPA-PSK
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    mixed2
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx", Security to WPA2/WPA-PSK
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    mixed2
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz SSID to "0123456789_6G_xxxx", Security to WPA2-PSK
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    mixed3
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz SSID to "0123456789_5G_xxxx", Security to WPA3/WPA2-PSK
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    mixed3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page


Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx", Security to WPA3/WPA2-PSK
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    mixed3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz SSID to "00000000000000000009azAZ#_6G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    wpa3
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz SSID to "00000000000000000009azAZ#_5G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    wpa3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz SSID to "00000000000000000009azAZ#_2G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    wpa3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz SSID to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    wpa3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz SSID to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    wpa3
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz Password to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    wpa3
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page


Change WiFi 5GHz Password to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    wpa3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz Password to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    mixed3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz SSID to "~!@#$%^&*()_+{}|:"<>?`-=[]\;',./" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    wpa3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz SSID to Uppercase letter "ABCDEFGHIJKLMNOPQRSTUVWXYZ_6G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    wpa3
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz SSID to Uppercase letter "ABCDEFGHIJKLMNOPQRSTUVWXYZ_5G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    wpa3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz SSID to Uppercase letter "ABCDEFGHIJKLMNOPQRSTUVWXYZ_2G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    wpa3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz SSID to "abcdefghijklmnopqrstuvwxyz_5G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    wpa3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz SSID to "abcdefghijklmnopqrstuvwxyz_6G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    wpa3
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz SSID to "abcdefghijklmnopqrstuvwxyz_2G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    wpa3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz SSID to "0123456789_5G_xxxx", Security to OPEN
    [Arguments]    ${ssid_name}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to OPEN
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz security type WPA3/WPA2 PAK and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    mixed3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz security type WPA3/WPA2 PAK and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}

    IF    ${Platform}=='SPF12'
        Change WiFi 6GHz Security to    mixed3
    ELSE IF    ${Platform}=='SPF13'
        sleep    1
    END

    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 6GHz SSID to "0123456789_6G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 6GHz SSID Name to    ${ssid_name}
    Change WiFi 6GHz Security to    wpa3
    Change WiFi 6GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page



Change WiFi 5GHz SSID to "0123456789_5G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 5GHz SSID Name to    ${ssid_name}
    Change WiFi 5GHz Security to    mixed3
    Change WiFi 5GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page


Verify Wireless PC can connect to DUT and access to Internet (OPEN)
    [Arguments]    ${ssid}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    Wait Until Keyword Succeeds    6x    10s    Retry Verify Wireless PC can connect to DUT and access to Internet (OPEN)    ${ssid}    ${device}    ${wifi_client_interface}    ${dut_gw}



Retry Verify Wireless PC can connect to DUT and access to Internet (OPEN)
    [Arguments]    ${ssid}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    [Documentation]    Connect to DUT with matched security key
    [Tags]    @AUTHOR=Frank_Hung

    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S rm /etc/NetworkManager/system-connections/2G* -f    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S rm /etc/NetworkManager/system-connections/5G* -f    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S nmcli dev disconnect ${wifi_client_interface}    prompt=gemtek@gemtek
    sleep    5
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall dhclient    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${wifi_client_interface} -r    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl restart NetworkManager.service    prompt=gemtek@gemtek
    sleep    3
    Wait Until Keyword Succeeds    4x    5s    Create OPEN Connection        ${device}    ${ssid}    ${wifi_client_interface}
    #Wait Until Keyword Succeeds    10x    5s    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S nmcli dev wifi connect ${ssid} password ${secruity_key} hidden yes    prompt=Device
    sleep    7
    #Wait Until Keyword Succeeds    10x    5s    Is WIFI Interface Up    ${device}    ${ssid}
    #sleep    5
    #Wait Until Keyword Succeeds    5x    1s    Is Get IP from DUT    ${device}    ${wifi_client_interface}
    #sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${wifi_client_interface} -r    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S sudo dhclient ${wifi_client_interface} &    prompt=gemtek@gemtek
    sleep    20
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S ifconfig    prompt=gemtek@gemtek
    log    ${result}
    Wait Until Keyword Succeeds    5x    1s    Is WiFi Ping Successful    ${device}    192.168.1.1    ${ssid}
    Wait Until Keyword Succeeds    5x    1s    Is WiFi Ping Successful    ${device}    ${dut_gw}    ${ssid}
    Wait Until Keyword Succeeds    5x    1s    Is WiFi Ping Successful    ${device}    www.gemteks.com    ${ssid}



Verify Wireless PC can connect to DUT and access to Internet
    [Arguments]    ${ssid}    ${wifi_password}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    Wait Until Keyword Succeeds    3x    10s    Retry Verify Wireless PC can connect to DUT and access to Internet    ${ssid}    ${wifi_password}    ${device}    ${wifi_client_interface}    ${dut_gw}

Retry Verify Wireless PC can connect to DUT and access to Internet
    [Arguments]    ${ssid}    ${wifi_password}    ${device}    ${wifi_client_interface}    ${dut_gw}
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl stop NetworkManager    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo 'network={' > /etc/wpa_supplicant/wpa_supplicant.conf
    cli    ${device}    echo '${SPACE * 4}ssid="${ssid}"' >> /etc/wpa_supplicant/wpa_supplicant.conf
    cli    ${device}    echo '${SPACE * 4}scan_ssid=1' >> /etc/wpa_supplicant/wpa_supplicant.conf
    cli    ${device}    echo '${SPACE * 4}psk="${wifi_password}"' >> /etc/wpa_supplicant/wpa_supplicant.conf
    cli    ${device}    echo '${SPACE * 4}key_mgmt=WPA-PSK' >> /etc/wpa_supplicant/wpa_supplicant.conf
    cli    ${device}    echo '}' >> /etc/wpa_supplicant/wpa_supplicant.conf
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_supplicant -B -i ${DEVICES.wifi_client.interface} -c /etc/wpa_supplicant/wpa_supplicant.conf    prompt=gemtek@gemtek
    sleep    20
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    Should Not Contain    ${result}    off/any
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface} -r&    prompt=gemtek@gemtek
    sleep    4
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface}&    prompt=gemtek@gemtek
    sleep    20
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    ${result}=    cli    ${device}    ifconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    log    ${result}
    ${result}=    cli    ${device}    ping -c 8 www.gemteks.com    prompt=gemtek@gemtek
    Should Contain    ${result}    ttl=
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek

Verify Wireless PC cannot connect to DUT and access to Internet by WPA3
    [Arguments]    ${ssid}    ${wifi_password}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl stop NetworkManager    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo 'pmf=2' > /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo 'sae_pwe=1' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo 'network={' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}ssid="${ssid}"' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}scan_ssid=1' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}sae_password="${wifi_password}"' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}key_mgmt=SAE' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}ieee80211w=2' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}proto=RSN' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}pairwise=CCMP' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}group=CCMP' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '}' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_supplicant -B -i ${DEVICES.wifi_client.interface} -c /etc/wpa_supplicant/wpa_supplicant_wpa3.conf    prompt=gemtek@gemtek
    sleep    30
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    Should Contain    ${result}    off/any
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface} -r&    prompt=gemtek@gemtek
    sleep    4
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface}&    prompt=gemtek@gemtek
    sleep    60
    ${result}=    cli    ${device}    ifconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    log    ${result}
    ${result}=    cli    ${device}    ping -c 8 www.gemteks.com    prompt=gemtek@gemtek
    Should Not Contain    ${result}    ttl=
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    Should Contain    ${result}    off/any

Verify Wireless PC can connect to DUT and access to Internet by nmcli
    [Arguments]    ${ssid}    ${wifi_password}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S rm /etc/NetworkManager/system-connections/*.nmconnection    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl restart NetworkManager    prompt=gemtek@gemtek
    sleep    2
    Wait Until Keyword Succeeds    30x    2s    Retry Verify Wireless PC can connect to DUT and access to Internet by nmcli    ${ssid}    ${wifi_password}    ${device}    ${wifi_client_interface}    ${dut_gw}

Retry Verify Wireless PC can connect to DUT and access to Internet by nmcli
    [Arguments]    ${ssid}    ${wifi_password}    ${device}    ${wifi_client_interface}    ${dut_gw}
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S nmcli dev wifi rescan    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S nmcli dev wifi connect ${ssid} password ${wifi_password} hidden on    prompt=gemtek@gemtek
    sleep    2

    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    Should Not Contain    ${result}    off/any
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface} -r&    prompt=gemtek@gemtek
    sleep    2
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface}&    prompt=gemtek@gemtek
    sleep    4
    ${result}=    cli    ${device}    ifconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    log    ${result}
    ${result}=    cli    ${device}    ping -c 8 www.gemteks.com    prompt=gemtek@gemtek
    Should Contain    ${result}    ttl=
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek







Verify Wireless PC can connect to DUT and access to Internet by WPA3
    [Arguments]    ${ssid}    ${wifi_password}    ${device}=wifi_client    ${wifi_client_interface}=${DEVICES.wifi_client.interface}    ${dut_gw}=172.16.11.1
    Wait Until Keyword Succeeds    3x    10s    Retry Verify Wireless PC can connect to DUT and access to Internet by WPA3    ${ssid}    ${wifi_password}    ${device}    ${wifi_client_interface}    ${dut_gw}

Retry Verify Wireless PC can connect to DUT and access to Internet by WPA3
    [Arguments]    ${ssid}    ${wifi_password}    ${device}    ${wifi_client_interface}    ${dut_gw}
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl stop NetworkManager    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo 'pmf=2' > /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo 'sae_pwe=1' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo 'network={' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}ssid="${ssid}"' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}scan_ssid=1' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}sae_password="${wifi_password}"' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}key_mgmt=SAE' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}ieee80211w=2' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}proto=RSN' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}pairwise=CCMP' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '${SPACE * 4}group=CCMP' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    cli    ${device}    echo '}' >> /etc/wpa_supplicant/wpa_supplicant_wpa3.conf
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_supplicant -B -i ${DEVICES.wifi_client.interface} -c /etc/wpa_supplicant/wpa_supplicant_wpa3.conf    prompt=gemtek@gemtek
    sleep    30
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    Should Not Contain    ${result}    off/any
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface} -r&    prompt=gemtek@gemtek
    sleep    4
    ${result}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.interface}&    prompt=gemtek@gemtek
    sleep    30
    ${result}=    cli    ${device}    ifconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek
    log    ${result}
    ${result}=    cli    ${device}    ping -c 8 www.gemteks.com    prompt=gemtek@gemtek
    Should Contain    ${result}    ttl=
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.interface}    prompt=gemtek@gemtek

Check Wireless PC has connected to DUT
    [Arguments]    ${device}    ${ssid}    ${wifi_client_interface}
    ${essid_1}=    cli    ${device}    iwconfig ${wifi_client_interface} | grep "ESSID:"    prompt=gemtek@gemtek
    log    ${essid_1}
    sleep    2
    Should Not Contain    ${essid_1}     off/any
    sleep    2

Create OPEN Connection
    [Arguments]    ${device}    ${ssid}    ${wifi_client_interface}
    ${temp_a}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S nmcli dev wifi connect ${ssid} hidden yes    prompt=gemtek@gemtek
    log    ${temp_a}
    sleep    10
    Check Wireless PC has connected to DUT    ${device}    ${ssid}    ${wifi_client_interface}


Create WPA3 Connection
    [Arguments]    ${device}    ${ssid}    ${secruity_key}    ${wifi_client_interface}
    ${temp_a}=    cli    ${device}    echo '${DEVICES.wifi_client.password}' | sudo -S nmcli dev wifi connect ${ssid} password ${secruity_key} hidden yes    prompt=gemtek@gemtek
    log    ${temp_a}
    sleep    10
    Check Wireless PC has connected to DUT    ${device}    ${ssid}    ${wifi_client_interface}

Is WiFi Ping Successful
    [Arguments]    ${device}    ${gw_ip}    ${ssid}    ${ping_count}=3
    [Documentation]    To check ping ip is successful
    [Tags]    @AUTHOR=Gemtek_Jujung_Chang

    ${result}    cli    ${device}   ping ${gw_ip} -c ${ping_count}
    log    ${result}
    Should contain    ${result}    bytes from

Click Save Button on WLAN Basic Config Page
#    execute javascript    window.scrollTo(0,1200)
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    click element    id=btn_apply
    Wait until element is visible    id=loading_message    timeout=10
    sleep    240
    Close Browser

Change WiFi 6GHz Password to
    [Arguments]    ${password}
    input_text    id=6g_wpa_key    ${password}
    sleep    1

Change WiFi 5GHz Password to
    [Arguments]    ${password}
    input_text    id=5g_wpa_key    ${password}
    sleep    1

Change WiFi 2.4GHz Password to
    [Arguments]    ${password}
    input_text    id=2g_wpa_key    ${password}
    sleep    1

Change WiFi 6GHz SSID Name to
    [Arguments]    ${ssid_name}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    input_text    id=6g_ssid    ${ssid_name}
    sleep    1

Change WiFi 5GHz SSID Name to
    [Arguments]    ${ssid_name}
    input_text    id=5g_ssid    ${ssid_name}
    sleep    1

Change WiFi 2.4GHz SSID Name to
    [Arguments]    ${ssid_name}
    input_text    id=2g_ssid    ${ssid_name}
    sleep    1

Change WiFi 2.4GHz Security to
    [Arguments]    ${type}
    Select From List By Value    id=authtype_2g    ${type}
    sleep    1

Change WiFi 6GHz Security to
    [Arguments]    ${type}
    execute javascript    window.scrollTo(0,1200)
    sleep    2
    Select From List By Value    id=authtype_6g    ${type}
    sleep    1

Change WiFi 5GHz Security to
    [Arguments]    ${type}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    sleep    2
    Select From List By Value    id=authtype_5g    ${type}
    sleep    1


Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx" and click "Save"
    [Arguments]    ${ssid_name}    ${password}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to    mixed3
    Change WiFi 2.4GHz Password to    ${password}
    Click Save Button on WLAN Basic Config Page

Change WiFi 2.4GHz SSID to "0123456789_2G_xxxx", Security to OPEN
    [Arguments]    ${ssid_name}
    Open WLAN Basic Config Page
    Disable Common SSID
    Change WiFi 2.4GHz SSID Name to    ${ssid_name}
    Change WiFi 2.4GHz Security to OPEN
    Click Save Button on WLAN Basic Config Page

Change WiFi 5GHz Security to OPEN
    Select From List By Value    id=authtype_5g_select    open
    sleep    1

Change WiFi 2.4GHz Security to OPEN
    Select From List By Value    id=authtype_2g_select    open
    sleep    1

Enable Mesh from GUI
    Open WLAN Basic Config Page
    Click Element    id=tab_mesh
    sleep    2
    ${enable_or_disable}=    get_element_attribute    id=switch_layout_enable_btn    class
    log    ${enable_or_disable}
    sleep    2
    Run Keyword If      '${enable_or_disable}'=='switch hidden-dom-removal'    click element    id=switch_layout_enable_btn
    sleep    2
    Click Element    id=apply
    sleep    180
    Close Browser


Open WLAN Basic Config Page
    Login GUI    ${URL}    ${DUT_Password}
    click element    id=lang_mainmenu_basic_setting
    sleep    2
    click element    id=lang_submenu_basic_setting_wlan
    sleep    2
    Wait until element is visible    id=switch_layout_single_ssid_enable
    sleep    1


#------------------------------------------------------WPS_Start
Retry WPS PBC
    [Tags]   @AUTHOR=Frank_Hung
    [Arguments]    ${WPS_bssid_WPC1}    ${wifi_device}
    Login GUI    ${URL}    ${DUT_Password}
    Click [PBC] Button on DUT WebUI
    Verify wireless client can associate to DUT for WPS PBC    ${WPS_bssid_WPC1}    ${wifi_device}    192.168.1.1

Click [PBC] Button on DUT WebUI
    [Tags]   @AUTHOR=Frank_Hung
    click element    id=lang_mainmenu_basic_setting
    sleep    2
    click element    id=lang_submenu_basic_setting_wlan
    sleep    2
    click element    id=tab_wifi_wps
    sleep    2
    Wait until element is visible    id=btn_pbc
    sleep    1
    click element    id=btn_pbc
    sleep    10
    Close Browser

Retry WPS PIN
    [Tags]   @AUTHOR=Frank_Hung
    [Arguments]    ${WPS_bssid_WPC1}    ${WPS_PIN_Code}    ${wifi_device}
    Verify wireless client can associate to DUT for WPS PIN    ${WPS_bssid_WPC1}    ${WPS_PIN_Code}    ${wifi_device}

Setting WPS to Unconfigured
    [Tags]   @AUTHOR=Frank_Hung
    Login GUI    ${URL}    ${DUT_Password}
    Go to WPS Page
    click element    xpath=//*[@id="statustitle"]/td/input
    sleep    30
    Close Browser

Go to WPS Page
    [Tags]    @AUTHOR=Frank_Hung
    click element    xpath=//*[@id="panel_ADVANCED"]/div[2]
    Wait until element is visible    id=AT_WIRELESS
    click element    id=AT_WIRELESS
    sleep    2
    click element    name=AT_wps_name
    sleep    3
    select_frame    id=content_main
    sleep    5
    Wait until element is visible    id=id_WPSEnable
    sleep    1

Reboot Wifi_Client_1
    [Tags]   @AUTHOR=Frank_Hung
    Wait Until Keyword Succeeds    3x    2s    cli    wifi_client    echo '${DEVICES.wifi_client.password}' | sudo -S /sbin/shutdown -r +1    prompt=Shutdown scheduled    timeout=30
    sleep    130
    Wait Until Keyword Succeeds    3x    10s    cli    wifi_client    ls    prompt=gemtek@gemtek    timeout=10

Retry WPS PBC Should Fail
    [Tags]   @AUTHOR=Frank_Hung
    [Arguments]    ${WPS_bssid_WPC1}    ${wifi_device}
    Login GUI    ${URL}    ${DUT_Password}
    Verify [PBC] Button is no visible
#    Click [PBC] Button on DUT WebUI
#    Verify DUT and Wireless PC are not connected by WPS PBC        ${WPS_bssid_WPC1}    wifi_client
#    sleep    60

Verify [PBC] Button is no visible
    click element    id=lang_mainmenu_basic_setting
    sleep    2
    click element    id=lang_submenu_basic_setting_wlan
    sleep    2
    click element    id=tab_wifi_wps
    sleep    6
    Element Should Not Be Visible    id=btn_pbc
    sleep    1
    Close Browser

Retry WPS PIN on Client
    [Tags]   @AUTHOR=Frank_Hung
    [Arguments]    ${wifi_device}
    ${PIN_Code}=    Start WPS-PIN and Get PIN Code    ${wifi_device}
    Setting the PIN Code to DUT    ${PIN_Code}
    Verify wireless client can associate to DUT by WPS PIN on Client    ${wifi_device}

Setting the PIN Code to DUT
    [Tags]   @AUTHOR=Frank_Hung
    [Arguments]    ${PIN_Code}
    Login GUI    ${URL}    ${DUT_Password}
    click element    id=lang_mainmenu_basic_setting
    sleep    2
    click element    id=menu_basic_setting_wlan
    sleep    2
    click element    id=tab_wifi_wps
    sleep    2
    Wait until element is visible    id=pin
    sleep    1
    input_text    id=pin    ${PIN_Code}
    sleep    1
    click element    id=btn_pin
    sleep    3
    Close Browser

#---------------------------------------WPS_Start
Verify wireless client can associate to DUT by WPS PIN on Client
    [Arguments]    ${device}    ${g_dut_gw}=172.16.11.1
    Wait Until Keyword Succeeds    5x    3s    Check WPS Client PIN is Success    ${device}
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.int}&    prompt=gemtek@gemtek
    sleep    15
    Wait Until Keyword Succeeds    12x    10s    Is WiFi Ping Successful    ${device}    ${g_dut_gw}    N/A

Check WPS Client PIN is Success
    [Arguments]    ${device}
    ${ESSID}=    cli    ${device}    iwconfig | grep "ESSID"    prompt=gemtek@gemtek
    sleep    2
    Should Not Contain     ${ESSID}    ESSID:off/any
    sleep    1

Start WPS-PIN and Get PIN Code
    [Arguments]    ${device}
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S nmcli dev disconnect ${DEVICES.wifi_client.int}    prompt=gemtek@gemtek
    sleep    5
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall dhclient    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.int} -r    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl restart NetworkManager.service    prompt=gemtek@gemtek
    sleep    10
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl stop NetworkManager.service    prompt=gemtek@gemtek
    sleep    10
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_supplicant -t -D nl80211 -i ${DEVICES.wifi_client.int} -c /etc/wpa_supplicant/wps_2.conf -B    prompt=gemtek@gemtek
    sleep    5
    ${PIN_Code}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_cli -i ${DEVICES.wifi_client.int} wps_pin any
    @{PIN_Code}=    Get Regexp Matches    ${PIN_Code}    \\d{8}
    ${PIN_Code}=    Strip String    ${PIN_Code}[0]
    log    ${PIN_Code}
    [Return]    ${PIN_Code}

Verify DUT and Wireless PC are not connected by WPS PBC
    [Arguments]    ${bssid}    ${device}    ${g_dut_gw}=172.16.11.1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S cp /etc/wpa_supplicant/wps_init.conf /etc/wpa_supplicant/wps_2.conf    prompt=gemtek@gemtek
    sleep    1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S rm /etc/NetworkManager/system-connections/Verizon*
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S nmcli dev disconnect ${DEVICES.wifi_client.int}    prompt=gemtek@gemtek
    sleep    5
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall dhclient    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.int} -r    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl restart NetworkManager.service    prompt=gemtek@gemtek
    sleep    10
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl stop NetworkManager.service    prompt=gemtek@gemtek
    sleep    10
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_supplicant -t -D nl80211 -i ${DEVICES.wifi_client.int} -c /etc/wpa_supplicant/wps_2.conf -B    prompt=gemtek@gemtek
    sleep    5
    Wait Until Keyword Succeeds    5x    3s    Check WPS-PBC Connect Fail    ${bssid}    ${device}
    sleep    120

Check WPS-PBC Connect Fail
    [Arguments]    ${bssid}    ${device}
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_cli -i ${DEVICES.wifi_client.int} wps_pbc ${bssid}    prompt=gemtek@gemtek
    sleep    3
    ${essid_1}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.int} | grep "ESSID:"    prompt=gemtek@gemtek
    log    ${essid_1}
    sleep    2
    Should Contain    ${essid_1}     off/any

Verify wireless client can associate to DUT for WPS PBC
    [Arguments]    ${bssid}    ${device}    ${g_dut_gw}=172.16.11.1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S cp /etc/wpa_supplicant/wps_init.conf /etc/wpa_supplicant/wps_2.conf    prompt=gemtek@gemtek
    sleep    1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S rm /etc/NetworkManager/system-connections/Verizon*
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S nmcli dev disconnect ${DEVICES.wifi_client.int}    prompt=gemtek@gemtek
    sleep    5
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_cli    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall dhclient    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.int} -r    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl stop NetworkManager    prompt=gemtek@gemtek
    sleep    10
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_supplicant -t -D nl80211 -i ${DEVICES.wifi_client.int} -c /etc/wpa_supplicant/wps_2.conf -B    prompt=gemtek@gemtek
    sleep    5
    Wait Until Keyword Succeeds    3x    3s    Check WPS-PBC Connect Success    ${bssid}    ${device}
    sleep    1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.int}&    prompt=gemtek@gemtek
    sleep    15
    Wait Until Keyword Succeeds    12x    10s    Is WiFi Ping Successful    ${device}    ${g_dut_gw}    N/A

Check WPS-PBC Connect Success
    [Arguments]    ${bssid}    ${device}
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_cli -i ${DEVICES.wifi_client.int} wps_pbc ${bssid}    prompt=gemtek@gemtek
    sleep    20
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.int}    prompt=gemtek@gemtek

Verify wireless client can associate to DUT for WPS PIN
    [Arguments]    ${bssid}    ${WPS_PIN_Code}    ${device}    ${g_dut_gw}=172.16.11.1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S cp /etc/wpa_supplicant/wps_init.conf /etc/wpa_supplicant/wps_2.conf    prompt=gemtek@gemtek
    sleep    1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S rm /etc/NetworkManager/system-connections/Verizon*
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S route del default    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S nmcli dev disconnect ${DEVICES.wifi_client.int}    prompt=gemtek@gemtek
    sleep    5
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall wpa_supplicant    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S killall dhclient    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.int} -r    prompt=gemtek@gemtek
    sleep    2
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S systemctl stop NetworkManager    prompt=gemtek@gemtek
    sleep    10
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_supplicant -t -D nl80211 -i ${DEVICES.wifi_client.int} -c /etc/wpa_supplicant/wps_2.conf -B    prompt=gemtek@gemtek
    sleep    5
    Wait Until Keyword Succeeds    3x    3s    Check WPS-PIN Connect Success    ${bssid}    ${device}
    sleep    1
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S dhclient ${DEVICES.wifi_client.int}&    prompt=gemtek@gemtek
    sleep    15
    Wait Until Keyword Succeeds    12x    10s    Is WiFi Ping Successful    ${device}    ${g_dut_gw}    N/A
    ${bssid_info}=    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S iwconfig ${DEVICES.wifi_client.int} | grep "Access Point:"    prompt=gemtek@gemtek


Check WPS-PIN Connect Success
    [Arguments]    ${bssid}    ${device}
    cli    ${device}    echo ${DEVICES.wifi_client.password} | sudo -S wpa_cli -i ${DEVICES.wifi_client.int} wps_reg ${bssid} ${WPS_PIN_Code}    prompt=gemtek@gemtek
    sleep    20
    ${result}=    cli    ${device}    iwconfig ${DEVICES.wifi_client.int}    prompt=gemtek@gemtek

#---------------------------------------------------WPS_END




