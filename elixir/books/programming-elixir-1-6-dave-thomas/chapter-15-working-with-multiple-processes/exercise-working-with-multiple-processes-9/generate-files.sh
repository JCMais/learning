#!/bin/bash 
readlink_cmd=readlink
if command -v greadlink &> /dev/null
then
    readlink_cmd=greadlink
fi

export SCRIPT_DIR="$(dirname "$($readlink_cmd -f "$0")")"

AMOUNT_FILES=150
RANDOM_WORDS=100

X=0

while [ "$X" -lt "$AMOUNT_FILES" ] 
do 
 $SCRIPT_DIR/random-word-generator.sh $RANDOM_WORDS > $SCRIPT_DIR/file-$X.txt
 let "X = X + 1"
done
