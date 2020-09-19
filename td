#!/bin/bash

#cp ~/.todolist2 .todolist
file="/home/niko/.todolist"
task=$2

function list {

i=1
while read line; do

echo "$i. $line"
i=$((i+1))

done < $file
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
    deleteLine $op
    ;;
"a")
    opts=${opts:1}
    echo $task >> $file
    ;;
"s")
    #switch op1 op2
    ;;
*)
    #do_nothing()
    ;;
esac

opts=${opts:1}

done

list
