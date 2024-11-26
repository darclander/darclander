#!/usr/bin/python3

import json
import argparse

def get_args():
    parser = argparse.ArgumentParser(description="")
    parser.add_argument("-i", "--input", type=str, required=True, help="")
    
    return parser.parse_args()

def generate_windows_theme(input_file):
    keys = [
        "black", "red", "green", "yellow", "blue", "purple", "cyan", "white",
        "brightBlack", "brightRed", "brightGreen", "brightYellow", "brightBlue",
        "brightPurple", "brightCyan", "brightWhite"
    ]

    hex_codes = read_hex_file(input_file)

    if len(hex_codes) - 1 != len(keys) - 1:
        raise ValueError(f"Expected {len(keys) - 1} hex codes, but got {len(hex_codes)}.")
    
    theme = {keys[i]: hex_codes[i] for i in range(len(hex_codes))}
    
    theme["cursorColor"] = "#FFFFFF"
    theme["background"] = theme["black"] # hex_codes[0]
    theme["foreground"] = theme["brightWhite"] # hex_codes[-1]
    theme["selectionBackground"] = theme["foreground"]

    theme["name"] = input_file
    
    output_file = f"{input_file}.win_theme"
    with open(output_file, 'w') as f:
        json.dump(theme, f, indent=4)
    print(f"Windows theme saved to {output_file}")

    return 0

def generate_bash_theme(input_file):
    hex_codes = read_hex_file(input_file)

    shell_script = ""
    shell_script += "#!/bin/bash\n"
    shell_script += "\n"
    shell_script += "declare -A colors=(\n"
    
    for idx,hex in enumerate(hex_codes):
        shell_script += f"\t[{idx}]=\"{hex}\"\n"
    
    shell_script += ")\n"
    shell_script += "\n"
    shell_script += "background=${colors[0]}\n"
    shell_script += "foreground=${colors[15]}\n"
    shell_script += "\n"

    shell_script += "for index in ${!colors[@]}; do\n"
    shell_script += "\techo -e \"\e]4;${index};${colors[$index]}\\a\"\n"
    shell_script += "done\n"
    shell_script += "\n"

    shell_script += "echo -ne \"\e]10;${foreground}\e\\\\\"\n"

    shell_script += "echo -ne \"\e]11;${background}\e\\\\\"\n"

    with open(f"{input_file}.sh", "w") as f:
        f.write(shell_script)
    print(f"Bash theme saved to: {input_file}.sh")

def read_hex_file(file_path):
    """
    Reads a file containing hex codes and returns them as a list.
    """
    with open(file_path, 'r') as f:
        return [line.strip() for line in f if line.strip()]

def main(args):
    input_file = args.input
    print(input_file)
    
    generate_windows_theme(input_file)

    generate_bash_theme(input_file)


if __name__ == "__main__":
    args = get_args()
    main(args)

