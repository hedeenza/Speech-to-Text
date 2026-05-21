#!/bin/env bash

# Set the audio file variable to the first command line argument
AUDIO=$1
# Derive the transcription file name from the audio file name
TEXT=${AUDIO%.*}".txt"

# Note - be sure to edit the following paths to reflect locations of your device
# Source the python virtual environment containing the speech_to_text pipeline
source /home/user/path/to/your/venv/bin-OR-Scripts/activate
# Run the python scripts
python-OR-py /home/user/path/to/your/speech_to_text.py $AUDIO >> $TEXT
