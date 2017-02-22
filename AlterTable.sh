#!/bin/bash
addcol(){
cat /dev/null  > tempfilename
cat /dev/null > tempwithcolon
    clear
meta="meta"
    echo "enter table you want to alter it "
  read tablename

#######
firstline=`head -n 1 $tablename`
######

    echo "Enter Field Name :"
    read  name
  

    if [ -f $tablename$meta ]
    then
        if cat $tablename$meta | grep $name
        then
            echo "Field already exists"
        else
                colname=$name
                echo "Enter col dataType (int/string) :"
                read  datatype

                if [ $datatype = "int" -o  $datatype = "string" ]
                then
                    colname+=":$datatype"
                else
                    echo "please enter vaild datatype"
                fi

                if cat $tablename$meta | grep -v "primary"
                then
                    echo "Set as primary key? (y/n) :"
                    read confirm

                    if [ $confirm = "y" ]
                    then
                        colname+=":primary"
                    fi
                fi

                echo $colname >> $tablename$meta

		##############################
		#name
		
		echo $firstline
		echo $firstline$name
		echo $tablename
		colonvar=":"

		cat $tablename > tempfilename
		awk 'NR==1{$0="'$firstline$name'"}1' $tablename > tempfilename
		cat tempfilename > $tablename


		while read line 
		do
		echo $line$colonvar >> tempwithcolon
		done < $tablename

		cat tempwithcolon > $tablename
		#awk '{$0=$0$colonvar}1' $tablename > tempfilename
		
        fi
    else
        echo "Table $tablename does no exists "
        break
    fi
}



#*-------------------


 dropcol(){
meta="meta"

   echo "enter table you want to alter it"
   read tablename

    echo "Enter Field Name :"
    read  name

    if [ -f $tablename$meta ]
    then
	echo $name
        if cat $tablename$meta | grep $name
        then
	    
            echo "Delete $name from table? (y/n)"
            read confirm

            if [ $confirm = "y" ]
            then
		######
		#To validate if primary do not drop
		while read coltemp
		do
		x=$(echo $coltemp|cut -d: -f1)
		if [ $x == $name ]
			then
			echo "jjjjjjjjjjjjjjj"
			y=$(echo $coltemp|cut -d: -f3)
			if [ "$y" == "primary" ]
				then
				echo "sorry cannot drop primary column"
				break;
				else
				echo $(sed '/'$name'/d' $tablename$meta) > $tablename$meta

				#delete from main table
				updateRecordDropColumn
				#end delete
			fi
		fi

		done < $tablename$meta
		#####
                #echo $(sed '/'$name'/d' $tablename$meta) > $tablename$meta
            fi

        else
            echo "Field does not exist"
        fi
    else
        echo "Table $tablename does no exists "
        break
fi
}
altertable(){
    clear
meta="meta"
    echo "enter table name"
read tablename

    if [ -f $tablename ]
    then
        while true
        do
            
            echo "$tablename Structure:"

            echo "**-*-*-*-*-*-*-*-"
                i=1
                for field in `awk -F: '{print $0}' ${tablename$meta}`
                do

                    colname=$(echo $field | cut -d: -f1)
                    datatype=$(echo $field | cut -d: -f2)
                    Primary=$(echo $field | cut -d: -f3)

                    colname="- $i $colname [$dataType]"

                    if [ $Primary ]
                    then
                        colname+=" Primary Key"
                    fi

                    echo $colname

                    ((i=i+1))

                done

            echo "*-*-*-*-*-*-*-*-"

            echo "1. Add A col"
            echo "2. Drop A col"
           

            read  line

            case $line in
                1) addcol $tablename ;;
                2) dropcol $tablename ;;
                3) break ;;
            esac
        done

    else
        echo "Table Does Not Exists"
    fi
}





updateRecordDropColumn(){
cat /dev/null >te

columnsNamesline=$(head -n1 $tablename) 


echo $columnsNamesline| awk -F: '{n=split($line,arr,":");  } END {for (i in arr) print arr[i]} '  >temp2


readarray  arrCols < temp2 
 
updateCol=$name
new=""
    
           ii=1
          
	    for col in ${arrCols[*]}
            do

                 if [ $col = $updateCol ]
                then
                   updateIndex=$ii;
		
		echo the column of update index is;
		echo $updateIndex;
                fi

                ii=$((ii+1))
            done


          while read  a
                  do 
                        xx=`echo $a | cut -d: -f$updateIndex` 
 
                        echo "${a//$xx/$new}" >> te

                      done < $tablename

    cat te >$tablename

}


altertable
