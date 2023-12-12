#!/usr/bin/env bash
# MakeFCList.sh
# Usage: bash scripts/MakeFCList.sh 

# List the files with ls and redirect (>) the output to bamIn.txt
ls /scratch/mohammad.ni/BINF6430/Projectwork/FeatureCounts/*.txt > /scratch/mohammad.ni/BINF6430/Projectwork/FeatureCounts/FCFilePaths.txt

InputFile="/scratch/mohammad.ni/BINF6430/Projectwork/FeatureCounts/FCFilePaths.txt"
OutputFile="/scratch/mohammad.ni/BINF6430/Projectwork/FeatureCounts/FCFileNames.txt"

for path in $(cat "$InputFile"); do
    file_name=$(basename "$path")
    # Remove the file extension
    file_name_without_extension="${file_name%.counts.txt}"
    echo "$file_name_without_extension" >> "$OutputFile"
done

