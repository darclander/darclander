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
    printf "\e]4;%d;%s\a" "$index" "${colors[$index]}"
done

# Set foreground
printf "\e]10;%s\e\\" ${foreground}

# Set background
printf "\e]11;%s\e\\" ${background}


