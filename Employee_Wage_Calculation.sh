#!/bin/bash

#Variables
isPresent=1;
randomCheck=$((RANDOM%2));

if (( $isPresent==$randomCheck ))
then
	echo "Employee is Present";
else
	echo "Employee is Absent"
fi
