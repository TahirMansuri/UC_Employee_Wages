#!/bin/bash -x

#Constants
IS_FULL_TIME=1;
IS_PART_TIME=2;
EMP_RATE_PER_HOUR=25;
TOTAL_WORKING_DAYS=21;
MAX_HOURS_IN_MONTH=150;

#Variables
totalEmpHrs=0;
totalWorkingDays=0;
totalSalary=0;
dailyWage=0;

declare -A empWageArray

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
	((totalWorkingDays++));

	getWorkingHours

	dailyWage=$(($empHrs*$EMP_RATE_PER_HOUR));

	empWageArray[(($totalWorkingDays-1))]=$dailyWage;

	totalEmpHrs=$(($totalEmpHrs+$empHrs));
done

totalSalary=$(($totalEmpHrs*$EMP_RATE_PER_HOUR));

empWageArray[$TOTAL_WORKING_DAYS]=$totalSalary;

echo "Total Working Days:"$totalWorkingDays;
echo "Total Working Hours:"$totalEmpHrs;
echo "Monthly Salary is:"$totalSalary;
echo "Wage by Days:"${empWageArray[@]};
