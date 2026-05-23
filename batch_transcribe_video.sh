#!/bin/bash

# Assign the name of the combined transcript
BATCH_TEXT="combined_text.txt"
# If the combined file already exists in the working directory...
if [[ -e $BATCH_TEXT ]]; then
    # Notify the user
    echo "Combined file exists, check contents or move file before running"
    # Exit the program
    exit 1
# Otherwise...
else
    # Notify the user of its creation
    echo "Creating combined_text.txt..."
fi

# Command line argument 1 is the desired file extension
EXTENSION=$1
# FILES are every file in the working directory that ends in the specified extension
FILES=(./*.$1)

# Set the increment value to start at 1
NUMBER=1
# For each file that matches the specified extension
for i in ./*.$1; do

    # Assign the file for this iteration to the video variable
    VIDEO=$i
    # Create a temporary audio file
    AUDIO="audio_out."$1
    # Create a transcript file from the video file name
    TEXT=${VIDEO%.*}".txt"

    # Notify the user which file is being processed
    # and how progress is going overall
    echo "Processing ${VIDEO#./*} (${NUMBER}/${#FILES[@]})..."

    # Create an audio file from the video file with ffmpeg
    ffmpeg -hide_banner -loglevel error -i $VIDEO -vn -acodec copy $AUDIO

    # Source the virtual environment
    source /home/user/path/to/where/the/venv/lives/venv/bin/activate
    # Run the speech_to_text script
    python3 /home/user/path/to/where/the/script/lives/speech_to_text.py $AUDIO | tee $TEXT >> $BATCH_TEXT

    # Remove the temporary audio file
    rm $AUDIO

    # Increment the counter
    ((NUMBER++))

done
