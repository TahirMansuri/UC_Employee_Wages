#!/bin/bash -x

#Variables
isPartTime=1;
isFullTime=2;
empRatePerHr=20;
randomCheck=$((RANDOM%2));

if (( $isFullTime==$randomCheck ))
then
	empHrs=8;
elif (( $isPartTime==$randomCheck ))
then
	empHrs=4;
else
	empHrs=0;
fi
salary=$(($empHrs*$empRatePerHr));
