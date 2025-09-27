#!/bin/bash

declare -A colors=(
	[0]="#222324"
	[1]="#E8341C"
	[2]="#68C256"
	[3]="#F2D42C"
	[4]="#1C98E8"
	[5]="#8E69C9"
	[6]="#1C98E8"
	[7]="#BABABA"
	[8]="#000000"
	[9]="#E05A4F"
	[10]="#77B869"
	[11]="#EFD64B"
	[12]="#387CD3"
	[13]="#957BBE"
	[14]="#3D97E2"
	[15]="#BABABA"
)

background=${colors[0]}
foreground=${colors[15]}

for index in ${!colors[@]}; do
	printf "\e]4;%d;%s\a" "$index" "$colors[$index]}"
done

printf "\e]10;%s\e\\" ${foreground}
printf "\e]11;%s\e\\" ${background}
