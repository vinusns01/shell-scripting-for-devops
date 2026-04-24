#!/bin/bash

echo "ENter file name :"
read filename

if [ -f $filename ]
then	
	echo "File exists"
else 
	touch $filename
fi
