printf "+-------------------------------------------------+"
printf "\n|  Name:    ALEN GRACE SKARIA   Reg NO: 1947203   |"
printf "\n+-------------------------------------------------+\n\n\n"

########################### Function Defintion ###########################
#Function 1 ==> to save the details into file
store_data()
{
printf "Enter the N record in the File: "
read n
for i in $(seq 1 $n);
do
printf "Enter the Record #$i\n\n"
printf "Enter the Employee Id: "
read eid
printf "Enter the Employee Name: "
read ename
printf "Enter the Designation: "
read des
printf "Enter the Basic Pay: "
read basic
$(echo $eid $ename $des $basic | cat >> pay.txt)
done
}


#Function 2 ==> to display and Calculate the pay from file 
disp_data()
{
printf "Enter the Designation: "
read des
if [ $des = "CEO" ]
then
b_pay=$(awk '{ if ($3 == "CEO") print $4}' pay.txt)
da=`echo "scale=3; 45 / 100 * $b_pay" | bc`
hra=`echo "scale=3; 12 / 100 * $b_pay" | bc`
pf=`echo "scale=3; 25 / 100 * $b_pay" | bc`
cca=400
gross_pay=`echo "scale=2; $b_pay + $da + $hra + $cca" | bc`
ap=`echo "scale=0; $gross_pay * 12" | bc`
if [ ${ap%.*} -gt 60000 ]
then
inc_tax=0.0
elif [ ${ap%.*} -gt 60000 -a  ${ap%.*} -ge 120000 ]
then
inc_tax=`echo "scale=2; 0.2 * $gross_pay" | bc`
elif [ ${ap%.*} -gt 120000 -a  ${ap%.*} -ge 180000 ]
then
inc_tax=`echo "scale=2; 0.2 * $gross_pay" | bc`
else
inc_tax=`echo "scale=2; 0.25 * $gross_pay" | bc`
fi
net_pay=`echo "scale=2; $gross_pay -($pf + $inc_tax)" | bc`
printf "\n\n+-----------------------------------------+"
printf "\n|            Calculation Of Salary        |"
printf "\n+-----------------------------------------+\n\n"
printf "The Basic Pay: 					           $b_pay\n"
printf "Dearness Allowance:  			                   $da\n"
printf "The HRA: 						   $hra\n"
printf "Provident Fund: 			                   $pf\n"
printf "Gross Pay:	 			                   $gross_pay\n\n\n"
printf "\n                                                          ---------"
printf "\n\nNet Pay:                                                   $net_pay\n\n"

elif [ $des = "MANAGER" ]
then
b_pay=$(awk '{ if ($3 == "MANAGER") print $4}' pay.txt)
da=`echo "scale=3; 45 / 100 * $b_pay" | bc`
hra=`echo "scale=3; 12 / 100 * $b_pay" | bc`
pf=`echo "scale=3; 25 / 100 * $b_pay" | bc`
cca=400
gross_pay=`echo "scale=2; $b_pay + $da + $hra + $cca" | bc`
ap=`echo "scale=0; $gross_pay * 12" | bc`
if [ ${ap%.*} -gt 60000 ]
then
inc_tax=0.0
elif [ ${ap%.*} -gt 60000 -a  ${ap%.*} -ge 120000 ]
then
inc_tax=`echo "scale=2; 0.2 * $gross_pay" | bc`
elif [ ${ap%.*} -gt 120000 -a  ${ap%.*} -ge 180000 ]
then
inc_tax=`echo "scale=2; 0.2 * $gross_pay" | bc`
else
inc_tax=`echo "scale=2; 0.25 * $gross_pay" | bc`
fi
net_pay=`echo "scale=2; $gross_pay -($pf + $inc_tax)" | bc`
printf "\n\n+-----------------------------------------+"
printf "\n|            Calculation Of Salary        |"
printf "\n+-----------------------------------------+\n\n"
printf "The Basic Pay: 					           $b_pay\n"
printf "Dearness Allowance:  			                   $da\n"
printf "The HRA: 						   $hra\n"
printf "Provident Fund: 			                   $pf\n"
printf "Gross Pay:	 			                   $gross_pay\n\n\n"
printf "\n                                                          ---------"
printf "\n\nNet Pay:                                                   $net_pay\n\n"
elif [ $des = "MANAGER" ]
then
b_pay=$(awk '{ if ($3 == "MANAGER") print $4}' pay.txt)
da=`echo "scale=3; 45 / 100 * $b_pay" | bc`
hra=`echo "scale=3; 12 / 100 * $b_pay" | bc`
pf=`echo "scale=3; 25 / 100 * $b_pay" | bc`
cca=400
gross_pay=`echo "scale=2; $b_pay + $da + $hra + $cca" | bc`
ap=`echo "scale=0; $gross_pay * 12" | bc`
if [ ${ap%.*} -gt 60000 ]
then
inc_tax=0.0
elif [ ${ap%.*} -gt 60000 -a  ${ap%.*} -ge 120000 ]
then
inc_tax=`echo "scale=2; 0.2 * $gross_pay" | bc`
elif [ ${ap%.*} -gt 120000 -a  ${ap%.*} -ge 180000 ]
then
inc_tax=`echo "scale=2; 0.2 * $gross_pay" | bc`
else
inc_tax=`echo "scale=2; 0.25 * $gross_pay" | bc`
fi
net_pay=`echo "scale=2; $gross_pay -($pf + $inc_tax)" | bc`
printf "\n\n+-----------------------------------------+"
printf "\n|            Calculation Of Salary        |"
printf "\n+-----------------------------------------+\n\n"
printf "The Basic Pay: 					           $b_pay\n"
printf "Dearness Allowance:  			                   $da\n"
printf "The HRA: 						   $hra\n"
printf "Provident Fund: 			                   $pf\n"
printf "Gross Pay:	 			                   $gross_pay\n\n\n"
printf "\n                                                          ---------"
printf "\n\nNet Pay:                                                   $net_pay\n\n"
else
printf "\n\n No Such Designation Exists in the File :(\n\n\n"
fi
}



disp_file()
{
cat pay.txt 
}
#########################################################################################

                                            ###################################
											#          MAIN   CODE            #
											###################################
											
while :
do
printf "                                                 +----------------------------------------------+"
printf "\n						 |                ABC Enterprise L.T.D          |"
printf "\n						 +----------------------------------------------+\n\n\n"
printf "1: --> Store the Details Of Employee"
printf "\n2: --> Display and Calculate the pay according to Designation"
printf "\n3: --> Display the Contents of File"
printf "\n4: --> Exit Script"
printf "\n\nMake your Choice: "
read n
if [ $n -eq 1 ]
then
store_data
elif [ $n -eq 2 ]
then
disp_data
elif [ $n -eq 3 ]
then
disp_file
elif [ $n -eq 4 ]
then
printf "\nThank you Visit Again !! :) \n"
exit
else
printf "\n\nWrong Input"
fi
done
