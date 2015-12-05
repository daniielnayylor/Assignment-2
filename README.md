# Assignment-2
This is my second assignment for Operating System in Practice for Leeds Beckett University


```
du --block-size=1M --max-depth 1 $1 | sort -rn | head -$2
```
This code shows a list folders from the current directory and there sizes.

```
#!/bin/bash

cd Documents
size=$(du -sbh "My Games")
if (( $size > 50 ))
then
        echo "[#    }"
fi
du --block-size=1M --max-depth 1 $1 | sort -rn | head -$2
```
The code i tried before didn't work and I have been tweeking the code above as it will display the list of directories and the 
folder sizes but trying to echo the "[#    ]" to show how large the folders are as kind of chart for my assignment isn't working
as when i try and check if the folder "My Games" is > 50 (50 being 50MB) is telling me:
./assignment2.sh: line 5: ((My Games > 50 : syntax error: invalid arithmetic operator (error token is "My Games > 50 ")

I need to make it look like this:
9674  [#####]  .
6959  [#####]  ./My Games
840   [#### ]  ./FIFA 16
801   [#### ]  ./FIFA 16 Demo
638   [###  ]  ./FIFA 15
239   [##   ]  ./Origin
142   [##   ]  ./runtime
25    [#    ]  ./Rockstar Games
20    [#    ]  ./Euro Truck Simulator 2
5     [#    ]  ./game

But it outputs this as the code for the [#    ] is wrong:
9674    .
6959    ./My Games
840     ./FIFA 16
801     ./FIFA 16 Demo
638     ./FIFA 15
239     ./Origin
142     ./runtime
25      ./Rockstar Games
20      ./Euro Truck Simulator 2
5       ./game





