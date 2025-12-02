#!/bin/bash

shopt -s expand_aliases # włącza aliasy
alias DATARUN1='date'

DATARUN2=`date`

echo `DATARUN1`
echo "--------"
ping -c 5 localhost > /dev/null
echo `DATARUN1`
echo "--------"
ping -c 5 localhost > /dev/null
echo $DATARUN2
echo "--------"
ping -c 5 localhost > /dev/null
echo $DATARUN2
echo "--------"
