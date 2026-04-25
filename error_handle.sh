#!/bin/bash

create_directory() {
mkdir demo
 }
if ! create_directory; then 
	echo "the code has been exited bcz directory alreay exists"
	exit 1
fi	

echo "This should not work bcz code is intruped"
