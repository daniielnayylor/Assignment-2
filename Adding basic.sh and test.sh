GUI.sh:
```
#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
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
    "3" "Directory Information" \
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
    dialog --title 'Confirmation!' --msgbox "Choice of Directory Confirmed!" 5 35
    ;;


    3 ) 
	
   	chmod +x traversal.sh
	$DIR/traversal.sh > $DIR/trav.txt
	COUNT=$(gawk '{ sum += $3 }; END { print sum }' $DIR/trav.txt)
	echo "total| " $COUNT >> $DIR/trav.txt
	dialog --stdout --textbox $DIR/trav.txt 22 70

      ;;

    4 ) dialog --title 'Current Directory' --msgbox $FILE 10 20

      ;;

  esac
done
```
traversal.sh:
```
#!/bin/bash

depth()
{
k=0
while [ $k -lt $1 ]
do
echo -n " "
let k++
#or use k=`expr $k + 1`
done
}

traverse()

{
ls "$1" | while read i
do
depth $1

if [ -d "$1/$i" ]
then
output=$(du -bs -h "$1/$i")
echo "dir. | " $output
else
result=$(du -ab --max-depth=0 -h "$1/$i")
echo "file | " $result
fi
done
}

if [ -z "$1" ]
then
traverse . 0
else
traverse $1 0
fi
```
test.sh:
```
yum -q list installed dialog &>/dev/null && ./GUI.sh || ./traversal.sh
```
basic.sh:
```
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

read -e -p "Enter the path to the file: " -i "" DIR

echo "Please choose an option!"
select yn in  "Show Directory Information" "Show Current Directory" "Exit" ; do
    case $yn in
        "Show Directory Information" ) chmod +x traversal.sh
	$DIR/traversal.sh > $DIR/trav.txt
	COUNT=$(gawk '{ sum += $3 }; END { print sum }' $DIR/trav.txt)
	echo "total| " $COUNT >> $DIR/trav.txt
	cat $DIR/trav.txt;;
	
        "Show Current Directory" ) echo $DIR;;
	"Exit" ) exit;;
    esac
done
```
