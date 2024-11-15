#!/bin/bash
Playing=""
Letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)

#echo "" >> Game_Files.txt

grep -Fxq "Player_Password_Date_Time_SessionNumber_Win_Loss_GeneratedLetter_GuessedWord" Game_Files.txt

if [ $?!=0 ]; then
    echo "Player_Password_Date_Time_SessionNumber_WinOrLoss_GeneratedLetter_GuessedWord" >> Game_Files.txt
fi

    read -p "Welcome to my game! do you have an account or not? enter "y" for yes or "n" for no." Account_Answer

if [ $Account_Answer == "n" ]; then
        read -p "please input your username. " Username
        read -p "please input your password. " Password
        echo $Username"_"$Password"_" >> Game_Files.txt
        echo "Welcome $Username".""
        User_Signed_In=true

        else if [ $Account_Answer == "y" ]; then
        read -p "please input your username. " Username
        read -p "please input your password. " Password
        grep -Fxq "$Username"_"$Password" Game_Files.txt
            if [ $?!=0 ]; then
            echo "Welcome $Username."
            User_Signed_In=true
            fi
        fi
fi

Session_Number=$(grep -c "$Username" Game_Files.txt)

read -p "Would you like to play? Press "y" for yes and "n" for no. " Playing


while [ $Playing == "y" ]
do
    Random_Number=$(( (RANDOM % 26) ))
    RandomLetter="${Letters[Random_Number -1]}"

     # Ask the user for a word as input and store that word as a variable.

    read -p "Type your word, any word! " User_Word

    if [[ $User_Word =~ "$RandomLetter" ]]; then
            echo "You won! The letter was $RandomLetter".""
            echo "$Username"_"$Password"_""$date"+%m-%d-%Y"""_""$date"+%H:%M:%S"""_"$Session_Number"_""Win_"$RandomLetter"_"$User_Word" >> Game_Files.txt
            echo ""
            read -p "Would you like to play again? Press "y" if yes, "n" for no. " Playing
            echo ""
            
        else
            echo "You lost :( The letter was $RandomLetter".""
            echo ""
            read -p "Would you like to play again? Press "y" for yes and "n" for no. " Playing
            echo ""
            
    fi

done

echo "Thanks for playing!"
        sleep 2
        exit