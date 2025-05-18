#!/usr/bin/python3

import json
import argparse
import os
import yaml
from pathlib import Path


def has_extensions(filepath, extensions):
    return os.path.splitext(filepath)[1].lower() in extensions

def extract_hex_colors(yaml_path):
    with open(yaml_path, 'r') as f:
        data = yaml.safe_load(f)

    # Extract values that start with #
    hex_colors = [value for value in data.values() if isinstance(value, str) and value.startswith('#')]
    return hex_colors

def get_args():
    parser = argparse.ArgumentParser(description="")
    parser.add_argument("-i", "--input", type=str, required=True, help="")
    
    return parser.parse_args()

def generate_windows_theme(hex_codes, o):
    keys = [
        "black", "red", "green", "yellow", "blue", "purple", "cyan", "white",
        "brightBlack", "brightRed", "brightGreen", "brightYellow", "brightBlue",
        "brightPurple", "brightCyan", "brightWhite"
    ]

    if len(hex_codes) != len(keys):
        raise ValueError(f"Expected {len(keys)} hex codes, but got {len(hex_codes)}.")
    
    theme = {keys[i]: hex_codes[i] for i in range(len(hex_codes))}
    
    theme["cursorColor"] = "#FFFFFF"
    theme["background"] = theme["black"] # hex_codes[0]
    theme["foreground"] = theme["brightWhite"] # hex_codes[-1]
    theme["selectionBackground"] = theme["foreground"]

    theme["name"] = o
    
    output_file = f"{o}.win_theme"
    with open(output_file, 'w') as f:
        json.dump(theme, f, indent=4)
    print(f"Windows theme saved to {output_file}")

    return 0

def generate_bash_theme(hex_codes, o):

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
    shell_script += "\tprintf \"\e]4;%d;%s\\a\" \"$index\" \"$colors[$index]}\"\n"
    shell_script += "done\n"
    shell_script += "\n"

    shell_script += "printf \"\e]10;%s\e\\\\\" ${foreground}\n"

    shell_script += "printf \"\e]11;%s\e\\\\\" ${background}\n"

    with open(f"{o}.sh", "w") as f:
        f.write(shell_script)
    print(f"Bash theme saved to: {o}.sh")

def read_hex_file(file_path):
    """
    Reads a file containing hex codes and returns them as a list.
    """
    with open(file_path, 'r') as f:
        return [line.strip() for line in f if line.strip()]

def main(args):
    input_file = args.input
    print(input_file)
    hex_codes = read_hex_file(input_file)
    if has_extensions(input_file, [".yml", ".yaml"]):
        hex_codes = extract_hex_colors(input_file)
        hex_codes[0] = hex_codes[16]
        hex_codes[15] = hex_codes[17]
        hex_codes = hex_codes[0:16]
    
    print(hex_codes)
    o = Path(input_file).stem
    generate_windows_theme(hex_codes, o)

    generate_bash_theme(hex_codes, o)


if __name__ == "__main__":
    args = get_args()
    main(args)

