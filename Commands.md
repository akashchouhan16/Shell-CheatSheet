# Shell commands

- > ls
  - list all files/folders
  - ls - l for permissions
  - directory/file(d/-) user(rwx) group(rwx) others(rwx) (total 10 bytes)
  - rwx - read write execute
- > head
  - list just the beginning few of ls
- > mkdir
  - make new directory
  - create nested directories if outer directory 'a' exists - mkdir a/b
  - create nested directories if outer directory 'a' doesn't exist - mkdir -p a/b (creates all parent directories)
- > cd
  - enter directory
- > cd ..
  - go one step back
- > pwd
  - displays path of present working directory
- > whoami
  - tells which user is logged in
- > create file
  - touch or echo > filename
  - cat > filename - concatenate empty file with filename (file doesn't exist)
  - cat filename - view file
  - cat >> filename - append at back of file
  - cat displays content content of one or more
- > grep
  - searches for command in file - grep "a" filename
  - Use -i tag for case insensitive
- > nl
  - line numbers when file is displayed
- > cut

  - extracts given number of bytes from each line - cut -b 1 filename. Here 1 is a specific byte in a line. This can be changed to ranges like 2-4 for 2 to 4 bytes.
  - -b is for bytes
    -c is for characters.
    -f is for fields
    -d is a delimeter (newline is the default delimeter)
  - For extracting first word on each line - cut -d " " -f 1 filename
  - For extracting from second word onwards on each line - cut -d " " -f 2- filename

- > chmod

  - to change permissions
  - chmod (u/g/o)(+/-)(r/w/x) filename
  - chmod u+x filename (Gives (adds) executable permission only for the user)
  - chmod ug-wx filename (Removes write and executable permission from user and group both)
  - Muliple permissions - chmod u=rwx, g=rw, o=r filename

- > chown

  - Change owner

- > chgrp
  - Change group

# Shell Scripting

.sh for shell scripts
To run -
./filename.sh
