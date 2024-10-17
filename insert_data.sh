#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

TRUNCATION_RESULT="$($PSQL "TRUNCATE games, teams;")"
echo $TRUNCATION_RESULT

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
  do
    if [[ $WINNER_GOALS != 'winner_goals' ]]
      then
        # echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
        # get WINNER_TEAM_ID
          WINNER_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")"
        # if WINNER_TEAM_ID is blank, insert team into teams
          if [[ -z $WINNER_TEAM_ID ]]
            then
              INSERT_WINNER_TEAM_RESULT="$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER');")"
              WINNER_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")"
          fi
        # get OPPONENT_TEAM_ID
          OPPONENT_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")"
        # if OPPONENT_TEAM_ID is blank, insert team into teams
          if [[ -z $OPPONENT_TEAM_ID ]]
            then
              INSERT_OPPONENT_TEAM_RESULT="$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT');")"
              OPPONENT_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")"
          fi
        # insert game into games
        INSERT_GAME_RESULT="$($PSQL "INSERT INTO 
          games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
          VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS);")"
    fi
done