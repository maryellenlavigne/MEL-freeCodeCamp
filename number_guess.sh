#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

LOGIN() {
  #ask for username ("Enter your username:")"
  echo "Enter your username:"
  read USERNAME
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")
  #is this a new user?
    if [[ -z $USER_ID ]]
      #yes
      then
        #add row
        ADD_ROW_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
        #pull user ID
        USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")
        #display new user message
        #"Welcome, <username>! It looks like this is your first time here."
        echo "Welcome, $USERNAME! It looks like this is your first time here."
      #no
      else
        #define variables
        GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID;")
        BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id = $USER_ID;")
          if [[ -z $BEST_GAME ]]
            then
              BEST_GAME=0
          fi
        #display welcome back message
        #"Welcome back, <username>! You have played <games_played) games, and your best game took <best_game> guesses."
        echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi

  NEW_GAME $USER_ID $USERNAME
}

NEW_GAME() {
  
  #set variables
  USER_ID=$1
  USERNAME=$2
  NUMBER_OF_GUESSES=0
  GAME_FINISHED=0
  
  #generate number between 1 and 1000
  let "SECRET_NUMBER = ( RANDOM % 1000 ) + 1"

  #prompt for guess
  echo "Guess the secret number between 1 and 1000:"
  read GUESS

  ((NUMBER_OF_GUESSES++))

  #check guess
  CHECK $GUESS $NUMBER_OF_GUESSES $SECRET_NUMBER
}

CHECK() {
  GUESS=$1
  NUMBER_OF_GUESSES=$2
  SECRET_NUMBER=$3

  #check for invalid response
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read NEW_GUESS
      ((NUMBER_OF_GUESSES++))
      CHECK $NEW_GUESS $NUMBER_OF_GUESSES $SECRET_NUMBER
  fi

  #case where guess is correct
  if [[ $GUESS == $SECRET_NUMBER ]]
    then
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      WRITE_GAME_TO_DB_RESULT=$($PSQL "INSERT INTO games(user_id,number_of_guesses) VALUES($USER_ID,$NUMBER_OF_GUESSES);")
      exit
  fi

  #case where guess is incorrect
  if [[ $GUESS < $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
  fi

  read NEW_GUESS
  ((NUMBER_OF_GUESSES++))
  CHECK $NEW_GUESS $NUMBER_OF_GUESSES $SECRET_NUMBER
}

LOGIN