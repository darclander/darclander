#!/bin/bash

declare -A colors=(
	[0]="#646464"
	[1]="#F58E8E"
	[2]="#A9D3AB"
	[3]="#FED37E"
	[4]="#7AABD4"
	[5]="#D6ADD5"
	[6]="#79D4D5"
	[7]="#D4D4D4"
	[8]="#646464"
	[9]="#F58E8E"
	[10]="#A9D3AB"
	[11]="#FED37E"
	[12]="#7AABD4"
	[13]="#D6ADD5"
	[14]="#79D4D5"
	[15]="#D4D4D4"
)

background=${colors[0]}
foreground=${colors[15]}

for index in ${!colors[@]}; do
	printf "\e]4;%d;%s\a" "$index" "$colors[$index]}"
done

printf "\e]10;%s\e\\" ${foreground}
printf "\e]11;%s\e\\" ${background}
