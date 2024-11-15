#!/bin/bash
# This is the game!
# Steps to Success:
# The game will create a file called Game_Files, if none already exists.
# It will then ask for login or to create an account.
# Once it has verified credentials VIA login or created account it will generate session # then ask to start the game.
# Once game is started, the game will generate a random letter and ask the user for input of a word (String).
# It will then check if the string includes the letter of the attempt or not.
# It will then record the attempt with account, date and time, session #, win or loss, generated letter, and guessed word.


# Creating the Letters array to define the 26 letters of the alphabet

Letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
#User_Signed_In=""

# If Game_Files is not in "echo ls" (looking in current directory) touch Game_Files. 
# (Or just append GameFiles)

echo "" >> Game_Files.txt

# If header information isn't in Game_Files as top line already then add it
grep -Fxq "Player_Password_Date_Time_SessionNumber_Win_Loss_GeneratedLetter_GuessedWord" Game_Files.txt
if [  $? != 0 ]; then
    echo "Player_Password_Date_Time_SessionNumber_WinOrLoss_GeneratedLetter_GuessedWord" >> Game_Files.txt
fi


if [ -z "$User_Signed_In" ]; then

 # Ask user for username or password or if they would like to create an account

    read -p "Welcome to my game! do you have an account or not? enter "y" for yes or "n" for no." Account_Answer

 # If username and password provided then check login credentials from Game_Files.
 #	If username and password match a record in Game_Files then display "Hello (user). press "s" to start the game!".
 #   If username and password DO NOT match a record in Game_Files then display "Username or password don't exist or don't match the database.".

    if [ $Account_Answer == "y" ]; then
        read -p "Please enter your username and password." Username Password
        if [ || grep -Fxq "$Username"_"$Password" Game_Files.txt ]; then
            echo "Welcome $Username."
            User_Signed_In=true
        else
                echo "Username or password don't exist or don't match the database."
        fi

     # If user opts to create credentials then ask for username and password and record those in Game_Files.
     # Then echo those credentials to the login algorythm and login then display "Hello (user). press "s" to start the game!".

    else if [ $Account_Answer == "n" ]; then
        read -sp "please input your username and password" UserName Password
        echo $Username"_"$Password"_" >> Game_Files.txt
        echo "Welcome $Username".""
        User_Signed_In=true

    else
        read -p "Press "s" to start the game, or "x" to exit." Playing
    fi

    read -p "Press "s" to start the game, or "x" to exit." Playing
fi

Session_Number=$(grep -c "$Username" Game_Files.txt)

 # Now. after the "s" key is pressed, generate the random letter and store it as a variable.

    if [ $Playing == "y" ]; then
        Random_Number=$(( (Random % 26) ))
        RandomLetter="${Letters[Random_Number -1]}"

     # Ask the user for a word as input and store that word as a variable.

        read -p "Type your word, any word!" User_Word

     # See if the guessed word contains the generated letter.
     # If the word does contain the letter, display "You won! the letter was (letter) and your word was (word)."
     # If the word does NOT contain the letter, display "You lost :( the letter was (letter) and your word was (word)."

        if [[ $User_Word =~ "$RandomLetter" ]]; then
            echo "You won! The letter was $RandomLetter".""
            echo "$Username"_"$Password"_""$date "+%m-%d-%Y"""_""$date "+%H:%M:%S"""_"$Session_Number"_""Win_"$RandomLetter"_"$User_Word" >> Game_Files.txt
            read -p "Would you like to play again? Press "y" if yes, "n for no."" Play_Again
            if [ $Play_Again == "y" ]; then
                continue

            else if [ $Play_Again == "n" ]; then
                echo "Thanks for playing!"
                sleep 5
                exit

            else
                read -p "Would you like to play again? Press "y" if yes, "n for no."" Play_Again
            fi

        #else
            echo "You lost :( The letter was $RandomLetter".""
            read -p "Would you like to play again?" Play_Again
            if [ $Play_Again == "y" ]; then
                continue

            else if [ $Play_Again == "n" ]; then
                echo "Thanks for playing!"
                sleep 5
                exit

            else
                read -p "Would you like to play again? Press "y" if yes, "n for no."" Play_Again
            fi
        fi

   # else if [ $Playing == "x" ]; then
        echo "Thanks for playing!"
        sleep 5
        exit

    #else
        read -p "Press "s" to start the game, or "x" to exit." Playing
fi
# Now record the attempt with account, date and time, win or loss, generated letter, and guessed word into Game_Files.
# Display "Would you like to play again? If so, press "y". if not press "n"."

# If yes, run game again.
# if no then display "The stats of the current session are (session Stats), Thanks for Playing

#END
exit 0