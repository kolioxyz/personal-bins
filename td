#!/bin/bash

#cp ~/.todolist2 .todolist
file="/home/niko/.todolist"
task=$2
toggle=$(head -n 1 $file)

function list {

toggle=$(head -n 1 $file)
if [ "$toggle" = "[true]" ]; then

i=1

sed 1d $file | while IFS=, read -r line
do
    echo "$i. $line"
    i=$((i+1))
done

fi
}

function deleteLine {

    sed -i $1d $file

}

function nextArg {

#$1=${$1:1}
opts=${opts:1}

}

### Main

opts=$1
str=$2

while [ -n "$opts" ]; do

op=${opts:0:1}

case "$op" in
"d")
    opts=${opts:1}
    op=${opts:0:1}
    num=$(($op + 1))
    deleteLine $num
    opts=${opts:1}
    ;;
"a")
    opts=${opts:1}
    echo $task >> $file
    ;;
"t")
    opts=${opts:1}
    if [ "$toggle" == "[true]" ]; then
        sed -i 1d $file
        sed -i "1i[false]" $file
        toggle="[true]"
    elif [ "$toggle" == "[false]" ]; then
        sed -i 1d $file
        sed -i "1i[true]" $file
        toggle="[true]"
    fi
    ;;
*)
    #do_nothing()
    ;;
esac

done
if [ -z $opts ]; then
list
fi

