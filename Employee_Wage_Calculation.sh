#!/bin/bash -x

#Constants
IS_FULL_TIME=1;
IS_PART_TIME=2;
EMP_RATE_PER_HOUR=25;
TOTAL_WORKING_DAYS=5;
MAX_HOURS_IN_MONTH=20;

#Variables
totalEmpHrs=0;
totalWorkingDays=1;
totalSalary=0;

function getWorkingHours()
{
	randomCheck=$((RANDOM%3));
	case $randomCheck in
		$IS_FULL_TIME)
			empHrs=8;
		;;
		$IS_PART_TIME)
			empHrs=4;
		;;
		*)
			empHrs=0;
		;;
	esac
}

while (( $totalEmpHrs < $MAX_HOURS_IN_MONTH && 
	$totalWorkingDays <= $TOTAL_WORKING_DAYS ))
do
	getWorkingHours

	((totalWorkingDays++));
	totalEmpHrs=$(($totalEmpHrs+$empHrs));
done

totalSalary=$(($totalEmpHrs*$EMP_RATE_PER_HOUR));

echo "Total Working Days:"$totalWorkingDays;
echo "Total Working Hours:"$totalEmpHrs;
echo "Monthly Salary is:"$totalSalary;
