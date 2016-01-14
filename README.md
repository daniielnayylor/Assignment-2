# Assignment-2
This is my second assignment for Operating System in Practice for Leeds Beckett University


```
du --block-size=1M --max-depth 1 $1 | sort -rn  > dir.txt
```
This code shows a list folders from the current directory and there sizes and then sends it to the text file sorted.

After trying to use Java to make it look nicer and try and code GUI in java I have found it easier to create the GUI in C.
The code below is what I have so far and have got it working.
```
#!/bin/bash
DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  dialog --title "$1" \
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
    --menu "Please select:" $HEIGHT $WIDTH 4 \
    "1" "Directory Selection" \
    "2" "Comfirm Choice" \
    "3" "Show chosen directory information" \
    "4" "Current Directory" \
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
	;;

	
    3 ) du --block-size=1M --max-depth 1 $1 | sort -rn  > dir.txt 
	result=$(cat dir.txt)
	display_result "Chosen Directory Information"
      ;;
       
    4 ) dialog --title 'Current Directory' --msgbox $FILE 100 50
      
      ;;

  esac
done
```
What this does is open a menu with 4 options. Option 1 allows you to choose a directory you wish to view, then you have to press option 2 which confirms the choice and does a CD commands. Then option 3 puts the information of the chosen directoriy into a text file and then that is opened and viewed. Option 4 shows the user which directory they have chosen to view.
