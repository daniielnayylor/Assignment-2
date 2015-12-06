# Assignment-2
This is my second assignment for Operating System in Practice for Leeds Beckett University


```
du --block-size=1M --max-depth 1 $1 | sort -rn | head -$2
```
This code shows a list folders from the current directory and there sizes.

After trying to do the whole program within the bash script I have decided my lack of knowledge with it is holding me back so now I have this small peice of code:
```
#!/bin/bash

cd Documents
du --block-size=1M --max-depth 1 $1 | sort -rn  > dir.txt
sed -e 's/$/ /' -i dir.txt
cat dir.txt
```
This small bit of bash script changes the path directory to my Documents on my pc and then outputs all of folders and there size to a text file in my documents and then outputs the text file by using cat.

By using java that I am a lot more comeptent with I have started to write a small program that reads the text file and then splits each line and creates two arrays so I can work out the sum of all the folders and divide it equally so i can then work out how to output the [####] chart that I am required to  do so, my java code so far is:

```
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.stream.IntStream;

/**
 * This is my program that I am going to use for my assignment 2 in
 * Operating Systems in Practice where it will read and then write to 
 * a file for a bash script.
 */
/**
 * @author Daniel
 */
public class OSAssignment2 {

	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		BufferedReader in = new BufferedReader(new FileReader("C:\\Users\\Daniel\\Documents\\dir.txt"), '\t');
		String line = in.readLine();
		while (line != null) {
			System.out.println(line);
			line = in.readLine();
			String array[] = line.split(".", 1);
			int size = Integer.parseInt(array[0]);
			int totalsize = IntStream.of(size).sum();
			System.out.print(totalsize);
		}

	}

}
```
So far my java program will read and output the text file contents into the console and I have tried to create two arrays by splitting the output by the "." so i can then add up all the numbers in the first half of the array and then add the [####] chart without having to mess about with the rest of the line of text and then just output the whole thing.

The output currently looks like this:
```
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
```

I need to make it look like this:
```
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
```
