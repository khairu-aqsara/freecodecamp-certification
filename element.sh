#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Decide what type of argument: number, symbol, name.
INPUT=$1

if [[ $INPUT =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$INPUT
else
  # Search by symbol or name
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$INPUT' OR name='$INPUT';")
fi

if [[ -z $ATOMIC_NUMBER ]]
then
  echo "I could not find that element in the database."
  exit
fi

RESULT=$($PSQL "
SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius
FROM elements
JOIN properties ON elements.atomic_number=properties.atomic_number
JOIN types ON properties.type_id=types.type_id
WHERE elements.atomic_number=$ATOMIC_NUMBER;
")

# read variables from pipe
IFS="|" read ANAME NAME SYMBOL TYPE MASS MELT BOIL <<< "$RESULT"

echo "The element with atomic number $ANAME is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
