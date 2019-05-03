# Tools for Mkbundle
This repository contains scripts, tools and examples to aid the creation of stand-alone executables with mono's mkbundle.

## bundle.sh
A simple shell script that allows the user to call the mkbundle command with some preset arguments. Also contains the ability to choose between mono versions:

1. Current System Mono
2. Mono 4.8.0 Ubuntu 14.04 x64
3. Mono 4.8.0 Ubuntu 14.04 x86

## mergemaps.py
Utility python script which can be used to merge different dll map configurations. Usually this will be /etc/mono/config plus any other configurations provided by your project references. The script ensures the resulting configuration does not have repeated dlls.

optional arguments:
  -h, --help            show this help message and exit
  --name name           Name of the generated dll map.
  --files files [files ...]
                        List of dll maps to merge.
  --debug debug         Print debug information.
