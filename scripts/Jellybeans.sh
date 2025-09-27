#!/bin/bash

declare -A colors=(
	[0]="#121212"
	[1]="#E27373"
	[2]="#94B979"
	[3]="#FFBA7B"
	[4]="#97BEDC"
	[5]="#E1C0FA"
	[6]="#00988E"
	[7]="#DEDEDE"
	[8]="#BDBDBD"
	[9]="#FFA1A1"
	[10]="#BDDEAB"
	[11]="#FFDCA0"
	[12]="#B1D8F6"
	[13]="#FBDAFF"
	[14]="#1AB2A8"
	[15]="#DEDEDE"
)

background=${colors[0]}
foreground=${colors[15]}

for index in ${!colors[@]}; do
	printf "\e]4;%d;%s\a" "$index" "$colors[$index]}"
done

printf "\e]10;%s\e\\" ${foreground}
printf "\e]11;%s\e\\" ${background}
