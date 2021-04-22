# Welcome to the Thacker Computer Guessing game! Where you initialize a range, the computer guesses in the range
# and you have to guess which number the computer guesses!, guesses exactly the guess are 3 points, 1 off are 2 point,
# and 2-5 off are 1 point!


read -p "Enter your player's name :   " player

read -p "Enter the cpu's name  :   " cpu

echo -e "\n"

echo -e "\n\nWELCOME TO THE NUMBER GUESSING GAME, YOU WILL INITIALIZE A RANGE FOR THE COMPUTER TO GUESS WITHIN, YOU HAVE TO GUESS WHICH NUMBER THE COMPUTER GUESSES!\nIF YOU GUESS EXACTLY THE NUMBER : 3 POINTS\nIF YOU GUESS 1 OFF : 1 POINTS\nIF YOU GUESS NOT 1 OFF : COMPUTER 1 POINT\nENTER A NUMBER OUT OF THE RANGE OR NOT A NUMBER, PROGRAM ENDS AND DISPLAYS SCORES"

computerScore=0
playerScore=0

read -p "Enter the range, x value [x,y] :    " x

read -p "Enter the range, y value [x,y] :    " y

while true; do
	echo -e "\nComputer guessing..."
	computerGuess=$(shuf -i $x-$y -n 1)
	sleep 5
	read -p "Your guess?   " guess
	if [ "$guess" -eq "$guess" -a "$guess" -ge "$x" -a "$guess" -le "$y" ] 2> /dev/null; then
		if [ "$guess" -eq "$computerGuess" ]; then
			echo -e "\n2 POINTS : GUESSED $cpu's GUESS EXACTLY"
			echo -e "\n$cpu's GUESS : $computerGuess \n YOUR GUESS : $guess"
			playerScore=$((playerScore+2))
		elif [ $((guess - computerGuess)) -eq "-1" -o $((guess-computerGuess)) -eq "1" ]; then
			echo -e "\n1 OFF : 1 POINT TO $player"
			playerScore=$((playerScore+1))
		else
			echo -e "\nGUESS > 1 OFF : 1 POINT TO $cpu"
			computerScore=$((computerScore+2))
		fi
	else
		break
	fi
	#echo -e "The computer guess is : $computerGuess"
done

echo -e "\n\n~=~=~=~=SCOREBOARD~=~=~=~=\n\n$cpu SCORE : $computerScore\n\n$player SCORE : $playerScore\n"

if [ "$computerScore" -gt "$playerScore" ]; then
	echo -e "\n$cpu wins!"
	exit 0
elif [ "$playerScore" -gt "$computerScore" ]; then
	echo -e "\n$player wins!"
	exit 0
else
	echo -e "\nTIE!"
	exit 0
fi
	
