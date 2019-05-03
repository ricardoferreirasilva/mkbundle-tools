import argparse
import xml.etree.ElementTree as ET
parser = argparse.ArgumentParser(description='Merge different mono dll maps into one.')
parser.add_argument('--name', metavar='name', help='Name of the generated dll map.',required=True)
parser.add_argument('--files', metavar='files',type=argparse.FileType('r'), nargs='+', help='List of dll maps to merge.',required=True)
parser.add_argument('--debug', metavar='debug', help='Print debug information.')


args = parser.parse_args()
print("Merging dll maps...")
for f in args.files:
    text = f.read()
    try:
        root = ET.parse(f.name).getroot()
    except:
       raise Exception('Invalid XML in the DLL map -> ' + f.name)
