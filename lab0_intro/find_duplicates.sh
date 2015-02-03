
cksum *.tiff | sort | uniq -d

This comand is used on the folder containing all picture files. cksum checks the integrity of all files ending by .tiff. The
output is then sorted and finally command uniq -d prints duplcated lines.  
Script based on "How to Sort and Remove Duplicate Photos in Linux" by Charla Schroder.
Available online on: http://www.linux.com/learn/tutorials/774031-how-to-sort-and-remove-duplicate-photos-in-linux
