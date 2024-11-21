#!/bin/bash

declare -A colors=(
	[0]="#282828"
	[1]="#cc241d"
	[2]="#98971a"
	[3]="#d79921"
	[4]="#458588"
	[5]="#b16286"
	[6]="#689d6a"
	[7]="#a89984"
	[8]="#928374"
	[9]="#fb4934"
	[10]="#b8bb26"
	[11]="#fabd2f"
	[12]="#83a598"
	[13]="#d3869b"
	[14]="#8ec07c" 
	[15]="#ffffff" 
)

background=${colors[0]} 
foreground=${colors[15]}

for index in ${!colors[@]}; do
        echo -e "\e]4;${index};${colors[$index]}\a"
done

# Set foreground
echo ${foreground}
echo -ne "\e]10;${foreground}\e\\"

# Set background
echo -ne "\e]11;${background}\e\\"


