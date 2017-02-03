# FindRogueElfs #
FindRogueElfs is a script designed to find [ELF](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format)
files on a Linux machine which are not part of any [RPM](https://en.wikipedia.org/wiki/RPM_Package_Manager)
on the system. This is useful for finding binary executables on a system which
were compiled from source or copied onto the system.

## Running ##
To run FindRogueElfs simply run the shell script. It will take a few minutes to
run and when its done will write the results to `unknownelf.txt`.

## How it works ##
1. Lists all files which are part of an RPM installed on the system
2. Lists all files under /
3. Run `diff` on the results of the file lists to find files which are not part
of an RPM
4. Run `file` on each of the files not from an RPM
5. Save each file name that matches `ELF .* executable` as a result

## Example ##
```
$ ./FindRogueElfs.sh
                ___,@
               /  <
          ,_  /    \  _,
      ?    \`/______\`/
   ,_(_).  |; (e  e) ;|
    \___ \ \/\   7  /\/    _\8/_
        \/\   \'=='/      | /| /|
         \ \___)--(_______|//|//|
          \___  ()  _____/|/_|/_|
             /  ()  \    `----'
            /   ()   \
           '-.______.-'
         _    |_||_|    _
        (@____) || (____@)
         \______||______/
Gathering rpm list...
Finding files not from RPMs...
Finding the executable files...
Ding fries are done!
/home/badguy/breakchroot
/usr/local/bin/c++
/usr/local/bin/cpp
/usr/local/bin/g++
```