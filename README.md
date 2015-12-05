# Assignment-2
This is my second assignment for Operating System in Practice for Leeds Beckett University


```
du -h --max-depth=1
```
This code shows a list folders from the current directory and there sizes.

```
#!/bin/bash 
 
if [ $# != 2 ]; then 
	echo "Incorrect number of arguments !" >&2 
	echo "USAGE: sortdirbysize [DIRECTORY] <first n directories>" 
fi 
du --block-size=1M --max-depth 1 $1 | sort -rn | head -$10  
```
A small piece of shell script that creates 2 arguments, the first is a directory name in which the search will start
and the second argument is the number of directories the script should out put, this would output 10 in order of size.

Now for my assignment I need to add a visual counter in the format of "[###   ]" or something simalar to show the scal of
how large the directory folder is.

When i go to Uni i need to compile this and test it and name it "Assignment2.sh" as the ".sh" 
