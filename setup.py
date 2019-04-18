#
# ESP32 setup tool
#

import os
import argparse

from shutil import copyfile

class CommandLineArguments():
	def __init__(self):
		self.sdk = None

def main():
	args = CommandLineArguments()
	parser = argparse.ArgumentParser(description='Initial configuration setup for lwIoT applications.')
	parser.add_argument('-s', '--sdk', metavar='PATH', help='Absolute path to the lwIoT SDK', required=True)
	parser.parse_args(namespace=args)
	cwd = os.path.dirname(os.path.realpath(__file__))
	copyfile(args.sdk + "/config/sdkconfig", str(cwd) + "/sdkconfig")
	

if __name__ == "__main__":
	main()
