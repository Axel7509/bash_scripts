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
    local -a empty_positions=()

    for ((i=0; i<9; i++)); do
        if [[ ${board[$i]} == " " ]]; then
            board[$i]=$computer_symbol
            check_game_over
            
            if [[ $game_over == true && $winner == $computer_symbol ]]; then
                valid=true
                game_over=false
                break
            fi
            board[$i]=" "
        fi
    done

    if [[ $valid == false ]]; then
        for ((i=0; i<9; i++)); do
            if [[ ${board[$i]} == " " ]]; then
                board[$i]=$player_symbol
                check_game_over
                
                if [[ $game_over == true && $winner == $player_symbol ]]; then
                    board[$i]=$computer_symbol
                    valid=true
                    game_over=false
                    break
                fi
                board[$i]=" "
                empty_positions+=($i)
            fi
        done
    fi

    if [[ $valid == false ]]; then
        local num_empty=${#empty_positions[@]}
        if [[ $num_empty -gt 0 ]]; then
            local random_index=$(( RANDOM % num_empty ))
            local position=${empty_positions[$random_index]}
            board[$position]=$computer_symbol
        fi
    fi
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
	game_over=false
	winner=" "
        check_game_over
        #echo -e "\n-------------------\n|game_over = $game_over|\n-------------------\n"
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
            echo "Player win!"
        else
            echo "Computer win!"
        fi
    else
        echo "Drow!"
    fi

}


main
