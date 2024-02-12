#!/bin/bash 

echo -e "\nLab_1-Osisp\n"

declare -a board=(" " " " " " " " " " " " " " " " " ")

function display_board {
    echo
    echo " ${board[0]} | ${board[1]} | ${board[2]} "
    echo "-----------"
    echo " ${board[3]} | ${board[4]} | ${board[5]} "
    echo "-----------"
    echo " ${board[6]} | ${board[7]} | ${board[8]} "
    echo
}

function player_move {
    local valid=false

    while [[ $valid == false ]]; do
        read -p "Player $current_player, select a position for your move (0-8): " position
    
	echo -e "Position = [ $position ]"
    
        if [[ $position =~ ^[0-8]$ ]]; then
            if [[ ${board[$position]} == " " ]]; then
                board[$position]=$player_symbol
                valid=true 
                #clear

            else
            	echo -e "Board position = [ ${board[$position]} ]"
                echo "This position has already been taken. Try again."
            fi
        else
            echo "Invalid input. Please enter a number from 0 to 8."
        fi
    done
}

function computer_move {
    echo "Computer move..."
    sleep 1

    local valid=false

    while [[ $valid == false ]]; do
        local position=$(( RANDOM % 9 ))

        if [[ ${board[$position]} == " " ]]; then
            board[$position]=$computer_symbol
            valid=true
        fi
    done
}

function check_winner() {
    if [[ ${board[$1]} == ${board[$2]} && ${board[$2]} == ${board[$3]} && ${board[$1]} != " " ]]; then
        winner=${board[$1]}
    fi
}

function check_draw {
    for cell in "${board[@]}"; do
        if [[ $cell == " " ]]; then
            return
        fi
    done

    draw=true
}

function print_list() {
    local list="$1"
    
    for item in "${list[@]}"; do
        echo "$item"
    done
}


function check_game_over {
    local -a winning_combinations=(
        "0 1 2" "3 4 5" "6 7 8" 
        "0 3 6" "1 4 7" "2 5 8" 
        "0 4 8" "2 4 6"         
    )

    for combination in "${winning_combinations[@]}"; do
        local positions=($combination)
        check_winner ${positions[0]} ${positions[1]} ${positions[2]}
    done

    check_draw

    if [[ $winner != " " || $draw == true ]]; then
        game_over=true
    fi
}

function main {
    clear
    player_symbol="X"
    computer_symbol="O"
    current_player=1
    winner=" "
    draw=false
    game_over=false

    display_board

    while [[ $game_over == false ]]; do
        if [[ $current_player == 1 ]]; then
            player_move
        else
            computer_move
        fi

        check_game_over
        
	clear
        display_board

        if [[ $game_over == true ]]; then
            break
        fi

        if [[ $current_player == 1 ]]; then
            current_player=2
        else
            current_player=1
        fi
    done

    if [[ $winner != " " ]]; then
        if [[ $winner == $player_symbol ]]; then
            echo "Win player $current_player!"
        else
            echo "Computer win!"
        fi
    else
        echo "Drow!"
    fi

}


main
