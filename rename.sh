#!/bin/bash
echo "当前目录为${PWD}"

function changename() {
	echo "$1"
	new=`echo $1|sed 's/^/abc/g'`
	#new=`echo $1|sed -r 's/abc(.*$)/\1/g'`
	
	`iconv -f GBK -t UTF8 $1 -o $new`

	mv $new $1
}


function travFolder(){
	flist=`ls $1`
	cd $1

	for f in $flist
	do
		if test -d $f
		then 
			travFolder $f
		else
			changename $f
		fi
	done

	cd ../
}


dir=./test
travFolder $dir
