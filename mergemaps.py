import argparse
import xml.etree.ElementTree as ET
parser = argparse.ArgumentParser(description='Merge different mono dll maps into one.')
parser.add_argument('--name', metavar='name', help='Name of the generated dll map.',required=True)
parser.add_argument('--files', metavar='files',type=argparse.FileType('r'), nargs='+', help='List of dll maps to merge.',required=True)
parser.add_argument('--debug', metavar='debug', help='Print debug information.')
args = parser.parse_args()

def elementExists(xml,element):
    exists = False
    for child in xml.findall("dllmap"):
        if child.get("dll") == element.get("dll"):
            exists = True
    return exists



print("Creating new dll config map -> " + args.name)
newConfiguration = ET.Element('configuration')



for f in args.files:
    text = f.read()
    try:
        xml = ET.parse(f.name).getroot()
    except:
       raise Exception('Invalid XML in the DLL map -> ' + f.name)
    else:
        for child in xml.findall("dllmap"):
            dll = child.get("dll")
            target = child.get("target")
            os = child.get("element")
            if elementExists(newConfiguration, child) == False :
                 newConfiguration.append(child)

text = ET.tostring(newConfiguration,encoding="unicode")
f = open(args.name, "a")
f.write(text)
f.close()
print("Done!")