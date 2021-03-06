#!/bin/bash


# Rename all image files in specified directory 
# Maxdepth 1 - goes 1 level deep
# If no directory is supplied - it defaults to user's home directory

USER_HOME=$(eval echo ~${SUDO_USER})

function renameAllImageFiles {
IFS=$(echo -en "\n\b") # $IFS determins field sperater 

dir=${1:-$USER_HOME} #defualt is home
prefix=${2:-OLD_}
arr=($(find $dir -maxdepth 1 \( -iname \*.png -o -iname \*.gif -o -iname \*.jpg \) )) #add more file types here if needed

if [ ${#arr[@]} == 0 ] 
then
  echo "No images found in directory" # no images are found
else
  for image in ${arr[@]}
  do
    mv $image ${image%${image##*/}}$prefix${image##*/} #add a prefix infront of image file
  done
fi
}

# Example
# renameAllImageFiles
# or
# renameAllImageFiles /home/sundeep/ NEWPREFIX_