#!/bin/bash

# Function to display the menu and get image selection
select_image() {
    # Use the current working directory
    DIR="$PWD"
    CUR_DIR="${PWD##*/}"

    # Check if directory exists (should always be true for $PWD, but good practice)
    if [ ! -d "$DIR" ]; then
        echo -e "\n[!]:[3x-c4p]:[error]:[$CUR_DIR does not exist]:[x]"
        sleep 1
        exit 1
    fi

    # Find image files (png, jpg, jpeg, gif) in the current directory
    mapfile -t images < <(find "$DIR" -maxdepth 1 -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" \))

    # Check if any images were found
    if [ ${#images[@]} -eq 0 ]; then
        echo "[!]:[3x-c4p]:[error]:[No images in $CUR_DIR]:[x]"
        sleep 1
        exit 1
    fi

    # Display images with numbers
    clear
    cat << "EOF"

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
  __   _____                    _  _          __
 | _| |___ /_  __           ___| || |  _ __  |_ |    [3x-c4p]:[v]:[1.0.0]
 | |    |_ \ \/ /  _____   / __| || |_| '_ \  | |    [d3k@t3ss3r4]:[2025]
 | |   ___) >  <  |_____| | (__|__   _| |_) | | |    [hack.the.planet]
 | |  |____/_/\_\          \___|  |_| | .__/  | |    [all.your.nekworks.are.belkng.to.us]
 |__|                                 |_|    |__|

|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
EOF
    echo -e "\n[^]:[3x-c4p]:[initializing]:[^]"
    sleep 1
    echo -e "[>]:[3x-c4p]:[...]\n"
    sleep 1
    echo -e "[>]:[3x-c4p]:[recon]:[images in $CUR_DIR]:[>]\n"
    sleep 1
    for i in "${!images[@]}"; do
        echo "[=]:[3x-c4p]:[file]:[$((i+1))]:[$(basename "${images[i]}")]"
    done

    # Prompt user for selection
    sleep 1
    echo -e " \n"
    read -p "[?]:[3x-c4p]:[choose an image to edit]:[q to quit]:[>]" choice
    echo -e "[>]:[3x-c4p]:[...]\n"
    sleep 1

    # Check if user wants to quit
    if [ "$choice" = "q" ] || [ "$choice" = "Q" ]; then
        echo -e "\n[x]:[3x-c4p]:[Exiting...]:[x]"
        sleep 1
        exit 0
    fi

    # Validate input is a number
    if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
        echo "[!]:[3x-c4p]:[error]:[your opinion is wrong]:[!]"
        sleep 1
        echo "[?]:[3x-c4p]:[try again]:[?]"
        sleep 1
        return 1
    fi

    # Validate choice is within range
    if [ "$choice" -lt 1 ] || [ "$choice" -gt ${#images[@]} ]; then
        echo "[!]:[3x-c4p]:[error]:[your opinion is wrong]:[!]"
        sleep 1
        echo "[?]:[3x-c4p]:[try again]:[?]"
        sleep 1
        return 1
    fi

    # Get selected image
    selected_image="${images[$((choice-1))]}"
    
    # Prompt user for the comment to add
    echo "[=]:[3x-c4p]:[$CUR_DIR]:[choice: $(basename "$selected_image")]:[=]"
    sleep 1
    read -p "[?]:[3x-c4p]:[$CUR_DIR > $(basename "$selected_image")]:[enter your comment]:[>]" user_comment

    # Check if the comment is empty
    if [ -z "$user_comment" ]; then
        echo "[!]:[3x-c4p]:[$CUR_DIR]:[error]:[comment is empty]"
        sleep 1
        echo -e "[!]:[3x-c4p]:[$CUR_DIR]:[you speechless chooms?]:[>]\n"
        sleep 1
        echo "[!]:[3x-c4p]:[$CUR_DIR]:[try again..]:[>]"
        return 1
    fi

    # Run exiftool command with the user-provided comment using -UserComment
    echo -e "\n[>]:[3x-c4p]:[$CUR_DIR > $(basename "$selected_image")]:[editing]:[>]"
    echo -e "[>]:[3x-c4p]:[...]\n"
    sleep 1
    exiftool -UserComment="$user_comment" "$selected_image"

    # Check if exiftool command was successful
    if [ $? -eq 0 ]; then
        echo -e "[!]:[3x-c4p]:[$CUR_DIR > $(basename "$selected_image")]:[edit_successful]:[!]\n"
    else
        echo -e "[!]:[3x-c4p]:[$CUR_DIR > $(basename "$selected_image")]:[error]:[edit_unsuccessful]:[x]\n"
        return 1
    fi

    return 0
}

# Main loop
while true; do
    # Clear the screen for a cleaner display
    clear

    # Call the function to select and edit an image
    if select_image; then
        # Prompt to continue or exit
        while true; do
            read -p "[?]:[3x-c4p]:[more edits?]:[y/n]:[?]" continue_choice
            case "$continue_choice" in
                [Yy]*)
                    break  # Break the inner loop to go back to the main loop and show the menu again
                    ;;
                [Nn]*)
                    echo "[x]:[3x-c4p]:[Exiting...]:[x]"
                    exit 0
                    ;;
                *)
                    echo "Please enter 'y' for yes or 'n' for no."
                    ;;
            esac
        done
    else
        # If there was an error (e.g., invalid input, empty comment), prompt to try again or exit
        while true; do
            # Avoid referencing selected_image directly; only use it if set
            if [ -n "$selected_image" ]; then
                read -p "[!]:[3x-c4p]:[$CUR_DIR > $(basename "$selected_image")]:[error_failure]:[try again? (y/n)]:[?]: " retry_choice
            else
                read -p "[!]:[3x-c4p]:[$CUR_DIR]:[error_failure]:[try again? (y/n)]:[?]: " retry_choice
            fi
            case "$retry_choice" in
                [Yy]*)
                    break  # Break the inner loop to go back to the main loop and show the menu again
                    ;;
                [Nn]*)
                    echo "[x]:[3x-c4p]:[Exiting...]:[x]"
                    exit 0
                    ;;
                *)
                    echo "Please enter 'y' for yes or 'n' for no."
                    ;;
            esac
        done
    fi
done
