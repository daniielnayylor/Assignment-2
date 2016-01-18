# Assignment-2
This is my second assignment for Operating System in Practice for Leeds Beckett University


```
du --max-depth 1 -h  | sort -rn  > dir.txt
```
This code shows a list of directories using a traversal script that was given as an example but I am yet to understand how to fully use the traversal method so the output I get isn't what I am looking for an doesn't include the folder sizes.

```
#!/bin/bash
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  dialog --title "$title" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "System Information" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 5 \
    "1" "Directory Selection" \
    "2" "Comfirm Choice" \
    "3" "Show chosen directory information" \
    "4" "Current Directory" \
    "5" "Total Directory Size" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      DIALOG=${DIALOG=dialog}

FILE=`$DIALOG --stdout --title "Please choose the directory" --fselect $HOME/ 14 48`

case $? in
        0)
                echo "\"$FILE\" chosen";;
        1)
                echo "Cancel pressed.";;
        255)
                echo "Box closed.";;
esac

      ;;
    2 ) cd $FILE
	dialog --title 'Confirmation!' --msgbox "Choice of Directory Confirmed!" 5 35
    ;;


    3 ) result=$(sh ./trav.sh)
	display_result "Ok"

      ;;

    4 ) dialog --title 'Current Directory' --msgbox $FILE 10 20

      ;;

    5 ) du -sh > dirtotal.txt
    result=$(cat dirtotal.txt)
    display_result "Total directory size"

      ;;

  esac
done
```
What this does is open a menu with 5 options. Option 1 allows you to choose a directory you wish to view, then you have to press option 2 which confirms the choice and does a CD commands. Then option 3 puts the information of the chosen directoriy into a text file and then that is opened and viewed. Option 4 shows the user which directory they have chosen to view. Option 5 shows the total size of the current directory.

Below is the code for my current trav.sh
```
#!/bin/bash
# Traverse a directory using depth first traversal technique
# Usage $0 directorypath
# otherwise it takes current working directory as directory path
traverse()
{
# Traverse a directory

ls "$1" | while read i
do
if [ -d "$1/$i" ]
then
echo Directory: $1/$i
traverse "$1/$i" `expr $2`
# Calling this as a subshell means that when the called
# function changes directory, it will not affect our
# current working directory
# If you call this in current shell it gives the error
# bash: traverse: No such file or directory after changing
# the current directory
fi
done
}

# $1 is directory path


# Here we are giving '0' is the current depth of direcory
traverse . 0
else
traverse $1 0
fi
```

