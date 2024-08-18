#!/bin/bash

# Access the full path using ZED_FILE
full_path="$ZED_FILE"

# Extract filename with extension
filename_ext=$(basename "$full_path")

# Extract filename and extension
filename="${filename_ext%.*}"
extension="${filename_ext##*.}"

echo "[running $filename_ext]"

if [[ "$extension" == "cpp" ]]; then
    g++ -std=c++17 "$full_path" -o .build/run && timeout 4s ./.build/run<.build/test.in>.build/test.out;
elif [[ "$extension" == "py" ]]; then
    python3 "$full_path";
else
    echo "no"
fi
