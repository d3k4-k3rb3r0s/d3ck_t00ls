#!/bin/bash
user=$USER

# Function to verify user password
verify_password() {
    local attempt=0
    local max_attempts=2
    
    while [ $attempt -lt $max_attempts ]; do
        echo -e "\n[!]:[scr33nsav3r]:[Exit]:[Password Required]:[!]"
        sleep 1
        read -sp "[?]:[scr33nsav3r]:[Exit]:[Enter the magic word, $user...]:[>]" password
        echo ""
        
        if echo "$password" | sudo -S -k true 2>/dev/null; then
            return 0
        else
            attempt=$((attempt + 1))
            if [ $attempt -eq 1 ]; then
                echo -e "\n[!]:[scr33nsav3r]:[ah! ah! ah!, you didn't say the magic word!]:[!]"
            else
                echo -e "\n[!]:[scr33nsav3r]:[Intruder Detected on System]:[!]"
                sleep .5
                echo -e "\n[!]:[scr33nsav3r]:[Intruder Detected on System]:[!]"
                sleep .5
                echo -e "\n[!]:[scr33nsav3r]:[Intruder Detected on System]:[!]"
                sleep .5
                echo -e "\n[!]:[scr33nsav3r]:[Intruder Detected on System]:[!]"
                sleep .5
                echo -e "\n[!]:[scr33nsav3r]:[Intruder Detected on System]:[!]"
                sleep .5
                echo -e "\n[!]:[scr33nsav3r]:[Intruder Detected on System]:[!]"
                sleep .5
                echo -e "\n[!]:[scr33nsav3r]:[Intruder Detected on System]:[!]"
                sleep .5
                echo -e "\n[!]:[scr33nsav3r]:[Intruder Detected on System]:[!]"
                sleep .5
                echo -e "\n[!]:[scr33nsav3r]:[Ejection Activated]:[!]"
                sleep 1
                clear
                #exit
                kill -9 -1
            fi
        fi
    done
    return 1
}

# Function to display menu
show_menu() {
    clear
    cat << "EOF"

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||         
         __                __________                                 _____        __   
        | _|  ___  ___ _ _|___ /___ / _ __            ___  __ ___   _|___ / _ __  |_ |         [scr33n-sav3r]:[v1]
        | |  / __|/ __| '__||_ \ |_ \| '_ \   _____  / __|/ _` \ \ / / |_ \| '__|  | |         [d3k@t3ss3r4]:[2025]
       _| |  \__ \ (__| |  ___) |__) | | | | |_____| \__ \ (_| |\ V / ___) | |     | |_        [hack.the.planet]
      (_) |  |___/\___|_| |____/____/|_| |_|         |___/\__,_| \_/ |____/|_|     | (_)       [all.your.nekworkz.are.belong.us]
        |__|                                                                      |__|  

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

EOF
    sleep .5
    echo -e "\n[?]:[scr33nsav3r]:[Menu]:\n"
    sleep .5
    echo "[1]:[Bpytop]"
    echo "[2]:[Asciiquarium]"
    echo "[3]:[Cmatrix]"
    echo -e "[4]:[Exit]\n"
    echo ""
}

# Handle single and double CTRL+C
trap 'double_ctrl_c' SIGINT

double_ctrl_c() {
    if [ -f /tmp/scr33nsav3r_ctrl_c ]; then
        rm -f /tmp/scr33nsav3r_ctrl_c
        echo ""
        clear
    cat << "EOF"

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||         
         __                __________                                 _____        __   
        | _|  ___  ___ _ _|___ /___ / _ __            ___  __ ___   _|___ / _ __  |_ |         [scr33n-sav3r]:[v1]
        | |  / __|/ __| '__||_ \ |_ \| '_ \   _____  / __|/ _` \ \ / / |_ \| '__|  | |         [d3k@t3ss3r4]:[2025]
       _| |  \__ \ (__| |  ___) |__) | | | | |_____| \__ \ (_| |\ V / ___) | |     | |_        [hack.the.planet]
      (_) |  |___/\___|_| |____/____/|_| |_|         |___/\__,_| \_/ |____/|_|     | (_)       [all.your.nekworkz.are.belong.us]
        |__|                                                                      |__|  

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

EOF
        echo -e "\n[!]:[scr33nsav3r]:[User Interrupt]:[!]"
        sleep 1
        verify_password && exit 0
    else
        touch /tmp/scr33nsav3r_ctrl_c
        (sleep 2; rm -f /tmp/scr33nsav3r_ctrl_c) &
        clear
        show_menu
        main_loop
    fi
}

# Main loop
main_loop() {
    while true; do
        read -p "[?]:[scr33nsav3r]:[Menu]:[Choose your weapon wisely, $user]: " choice
        
        case $choice in
            1)
                bpytop
                clear
                show_menu
                ;;
            2)
                asciiquarium
                clear
                show_menu
                ;;
            3)
                cmatrix
                clear
                show_menu
                ;;
            4)
                clear
    cat << "EOF"

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||        
         __                __________                                 _____        __   
        | _|  ___  ___ _ _|___ /___ / _ __            ___  __ ___   _|___ / _ __  |_ |         [scr33n-sav3r]:[v1]
        | |  / __|/ __| '__||_ \ |_ \| '_ \   _____  / __|/ _` \ \ / / |_ \| '__|  | |         [d3k@t3ss3r4]:[2025]
       _| |  \__ \ (__| |  ___) |__) | | | | |_____| \__ \ (_| |\ V / ___) | |     | |_        [hack.the.planet]
      (_) |  |___/\___|_| |____/____/|_| |_|         |___/\__,_| \_/ |____/|_|     | (_)       [all.your.nekworkz.are.belong.us]
        |__|                                                                      |__|  

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

EOF
                verify_password && exit 0
                clear
                show_menu
                ;;
            *)
                echo -e "\n[!]:[scr33nsav3r]:[ah! ah! ah!, wrong again $user]:[!]"
                sleep .5
                echo "[!]:[scr33nsav3r]:[Try again!]:[>]"
                sleep 1
                clear
                show_menu
                ;;
        esac
    done
}

# Main execution
clear
show_menu
main_loop
