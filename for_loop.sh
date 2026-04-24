#!/bin/bash
# THis is for and while loop
<< task 
1 argumen 1 which folder
2 starting range
3 ending range
task
 
for (( i = $2 ; i <= $3 ; i++ ))
do 
	mkdir "$1$i"
done	
