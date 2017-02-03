#!/bin/bash
#Created by Drew Bonasera
echo "                ___,@"
echo "               /  <"
echo "          ,_  /    \  _,"
echo "      ?    \\\`/______\\\`/"
echo "   ,_(_).  |; (e  e) ;|"
echo "    \___ \ \/\   7  /\/    _\8/_"
echo "        \/\   \'=='/      | /| /|"
echo "         \ \___)--(_______|//|//|"
echo "          \___  ()  _____/|/_|/_|"
echo "             /  ()  \    \`----'"
echo "            /   ()   \\"
echo "           '-.______.-'"
echo "         _    |_||_|    _"
echo "        (@____) || (____@)"
echo "         \______||______/"
echo "Gathering rpm list..."
rpm -qa | xargs -l rpm -ql | sort > rpmfilelist.txt
echo "Finding files not from RPMs..."
find / -type f 2>/dev/null | sort > filelist.txt
diff filelist.txt rpmfilelist.txt | grep '^<' | sed 's/^<\ //'  | sort > notrpmfiles.txt
echo "Finding the executable files..."
cat notrpmfiles.txt | xargs -l file 2>/dev/null | grep 'ELF .* executable' | cut -d ':' -f 1 | sort > unknownelf.txt
echo "Ding fries are done!"
cat unknownelf.txt
rm -f elflist.txt rpmfilelist.txt notrpmfiles.txt filelist.txt
