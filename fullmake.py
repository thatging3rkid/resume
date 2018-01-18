#!/usr/bin/python3
"""
fullmake.py

Make a file by combining two latex files.

Best called by doing:
python3 fullmake.py resume.tex header.txt chenley-resume.temp.tex
"""
import os
import sys

def main():
	# Check the number of arguments
	if len(sys.argv) <= 3:
		print("not enough arguments!", file=sys.stderr)
		sys.exit(1)

	entries = dict()

	# Start by reading in the replacement file
	for line in open(sys.argv[2], "r").read().split("\n"):
		# Check for comments
		if line.lstrip().startswith("%"):
			continue

		# Add the entry into the dictionary
		entries[line[:line.index("{")]] = line[line.index("{") + 1:line.rindex("}")]
		print(entries)

main()