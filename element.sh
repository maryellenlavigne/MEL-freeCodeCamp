#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

FAILTEXT="I could not find that element in the database."

OUTPUT() {
  case $1 in
    a) 
      ATOMIC_NUMBER=$2
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER;")
      NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER;")
    ;;
    b) 
      NAME=$2
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$NAME';")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$NAME';")
    ;;
    c) 
      SYMBOL=$2
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$SYMBOL';")
      NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$SYMBOL';")
    ;;
    *) 
      echo "$FAILTEXT"
      exit
    ;;
  esac

  TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
  TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID;")
  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
  MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
  BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")

  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
}

if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
    exit
fi

if [[ $1 =~ ^[0-9]+$ ]]
  then
    SELECTED_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1;")
    if [[ -z $SELECTED_ATOMIC_NUMBER ]]
      then
        echo "$FAILTEXT"
        exit
      else
        OUTPUT a $SELECTED_ATOMIC_NUMBER
    fi
  else 
    SELECTED_ATOMIC_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1';")
    if [[ -z $SELECTED_ATOMIC_SYMBOL ]]
      then
        SELECTED_NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1';")
        if [[ -z $SELECTED_NAME ]]
          then
            echo "$FAILTEXT"
            exit
          else
            OUTPUT b $SELECTED_NAME
        fi
      else
        OUTPUT c $SELECTED_ATOMIC_SYMBOL
    fi
fi
