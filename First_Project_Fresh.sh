#!/bin/bash

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

read -p "Press "s" to start the game, or "x" to exit." Playing

while [ $Playing="s" ]
do

done


exit