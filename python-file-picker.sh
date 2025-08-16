#!/bin/bash

shopt -s nullglob
py_files=(*.py)

if (( ${#py_files[@]} == 0 )); then
    echo "We couldn't find any .py files in this directory. Please create one."
    exit 1
fi


if (( ${#py_files[@]} == 1 )); then
    vi "${py_files[0]}"
else
    PS3="Choose a file number: "
    select file in "${py_files[@]}"; do
        if [[ -n $file ]]; then
            vi "$file"
            break
        else
            echo "Invalid choice. Try again."
        fi
    done
fi
