#!/usr/bin/python3

from pathlib import Path
import argparse
import shutil
import subprocess
import sys

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
	parser.add_argument("--packages", action="store_true", help="Install packages")
	parser.add_argument("--ubuntu", action="store_true", help="Install packages for Ubuntu")
	parser.add_argument("--package-file", type=str, help="Specify path for packages file")

	args = parser.parse_args()
	return args


def run(cmd):
	try:
		subprocess.run(cmd, check=True)
	except subprocess.CalledProcessError as e:
		print(f"Command failed: ${e}")
		sys.exit(1)


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


def install_ubuntu(args):
	packages = []
	pf = args.package_file or "ubuntu.txt"
	with open(pf, "r") as package_list:
		packages = [p.strip() for p in package_list.readlines()]
	
	pkg_string = " ".join(packages)
	cmd = ["sudo", "apt", "install", "-y"] + packages
	run(cmd)


def install_packages(args):
	if args.ubuntu:
		install_ubuntu(args)
		return True
	return False


def main():
	args = parse_args()
	setup_dirs()
	
	if args.copy_rc:
		copy_rc()

	if args.packages:
		install_packages(args)


if __name__ == "__main__":
	main()

