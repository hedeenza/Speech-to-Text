#!/bin/bash

# Assign the first command line argument to the video file variable
VIDEO=$1
# Derive the audio file name from the video file name
AUDIO="audio_out."${VIDEO#*.}
# Derive the transcription file name from the video file name
TEXT=${VIDEO%.*}".txt"

# Use ffmpeg to strip the audio from the video file and create a temporary audio file
ffmpeg -hide_banner -loglevel error -i $VIDEO -vn -acodec copy $AUDIO

# Note - be sure to edit the following paths to reflect locations of your device
# Source the python virtual environment containing the speech_to_text pipeline
source /home/user/path/to/your/venv/bin-OR-Scripts/activate
# Run the python scripts
python-OR-py /home/user/path/to/your/speech_to_text.py $AUDIO >> $TEXT

# Remove the temporary audio file,
# leaving the original video file and transcription
rm $AUDIO
