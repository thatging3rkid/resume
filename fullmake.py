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

	entries = list()

	# Start by reading in the replacement file
	for line in open(sys.argv[2], "r").read().replace("\r\n", "\n").split("\n"):
		# Check for comments
		if line.lstrip().startswith("%"):
			continue

		# Add the entry into the dictionary
		entries.append(line)
	
	# Next, read in the source file and check for a replacement tag
	replacement_mode = False
	text = str()
	for line in open(sys.argv[1], "r").read().replace("\r\n", "\n").split("\n"):
		# Check for an exit to replacement mode
		if replacement_mode:
			if line.strip() == "%@replend":
				replacement_mode = False
			continue

		# Check for an entrance to replacement mode
		if line.strip() == "%@replace":
			replacement_mode = True
			text += "% fullmake.py by Connor Henley (@thatging3rkid)\n% replacement mode started\n"  # put in some debugging text

			# Enter all the replacement text
			for entry in entries:
				text += str(entry) + "\n"

			text += "% replacement mode completed\n"  # put in some debugging text

		else:
			text += line + "\n"

	f = open(sys.argv[3], "w")
	# Check for OS before writing to disk
	if os.name == "nt":
		f.write(text.replace("\n", "\r\n"))
	else:
		f.write(text)
	f.close()

main()
