#!/bin/bash -x

#Variables
isPresent=1;
randomCheck=$((RANDOM%2));

if (( $isPresent==$randomCheck ))
then
	empRatePerHr=20;
	empHrs=8;
	salary=$(($empHrs+$empRatePerHr));
else
	salary=0;
fi
