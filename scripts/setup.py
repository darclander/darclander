#!/usr/bin/python3

from pathlib import Path
import argparse
import shutil

PATHS = [
    "~/.config/nvim/",
    "~/.zsh/",
    "~/.zsh/plugins/",
    "~/.zsh/zsh-autosuggestions",
    "~/github"
]

CONFIG_RC_PATH = Path("./config/dotfiles/")
HOME = Path.home()

def parse_args():
    parser = argparse.ArgumentParser(description="Setup script")

    parser.add_argument("--copy-rc", action="store_true", help="Copy rc files")
    parser.add_argument("--debug", action="store_true", help="Enable debug")

    args = parser.parse_args()
    return args


def setup_dirs():
    print("Setting up dirs")
    for p in PATHS:
        Path(p).expanduser().mkdir(parents=True, exist_ok=True)

def copy_rc():
    print("Copying RC")
    
    if not CONFIG_RC_PATH.exists():
        print("No rc files found")
        return
    
    for file in CONFIG_RC_PATH.iterdir():
        dst = HOME / file.name
        if file.is_file():
            shutil.copy2(file, dst)
            print(f"Copied {file} -> {dst}")


def main():
    args = parse_args()
    setup_dirs()
    
    if args.copy_rc:
        copy_rc()


if __name__ == "__main__":
    main()

