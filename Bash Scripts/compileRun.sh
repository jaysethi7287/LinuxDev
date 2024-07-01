#!/bin/zsh

# compiles and runs with arguments for C programs

# arg1 = file to compile 
# arg2 = compiled file name
# after compiling, prompted for arguments to run the compiled file

fileName=$1
toSave=$2

# check if file exists
if [[ ! -f "$fileName" ]]; then
    echo "File does not exist"
    exit 1
fi

# compiling
if [[ -n "$toSave" ]]; then
    echo "Compiling $fileName as $toSave"
    echo "---------------------------------"
    gcc "$fileName" -o "$toSave" || echo "Compilation failed"
else
    toSave="${fileName%.*}.out"
    echo "Compiling $fileName as $toSave"
    echo "---------------------------------"
    gcc "$fileName" -o "$toSave" || echo "Compilation failed"
fi

# receive arguments to run
echo "Provide arguments to run $toSave:" && read arguments 
echo "---------------------------------"
# running
echo "Running $toSave"
echo "---------------------------------"
chmod +x ./"$toSave"  || echo "Permission to execute denied"
./"$toSave" $arguments || echo "Running failed"