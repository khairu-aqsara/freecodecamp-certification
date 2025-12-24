#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN() {
  # Generate random number between 1 and 1000
  SECRET=$(( RANDOM % 1000 + 1 ))
  # Prompt for username
  echo "Enter your username:"
  read USERNAME

  # Check if user exists
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  if [[ -z $USER_ID ]]
  then
    # New user
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    # Existing user, get stats
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  echo "Guess the secret number between 1 and 1000:"
  GUESSES=0
  while true
  do
    read GUESS
    # Check integer
    if ! [[ $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      continue
    fi
    GUESSES=$((GUESSES+1))
    if [[ $GUESS -lt $SECRET ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $GUESS -gt $SECRET ]]
    then
      echo "It's lower than that, guess again:"
    else
      # Correct
      echo "You guessed it in $GUESSES tries. The secret number was $SECRET. Nice job!"
      # Insert into games
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES);")
      break
    fi
  done
}

MAIN
