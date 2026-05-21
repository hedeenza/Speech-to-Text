# Speech-to-Text

## Description:
- A speech-to-text pipeline using OpenAI's Whisper model. The Python and Bash scripts will allow users to process individual audio or video files, as well as batches of audio or video files that are to be combined into one transcript.
- Sped up audio / video (i.e. at 1.25x, 1.5x, 2x speed) can be processed, but it seems the faster the audio, the greater the likelihood of a particular kind of parsing error occurs. With this error, there is no punctuation and all words are lowercase.
- Tools for "cleaning" output transcripts are planned.

## Get the Files
- You may copy and paste the desired files or download them from "Releases".

## Create and Activate the Virtual Environment
Create Virtual Environment: `python -m venv venv`

Activate Virtual Environment: 
- Windows Powershell: `.\venv\Scripts\activate`
- macOS + Linux: `source venv/bin/activate`

## Download Modules + Dependencies
Download and install FFmpeg [here](https://ffmpeg.org/download.html) or by using your preferred package manager.  
Download the latest version of ![OpenAI's Whisper.](https://github.com/openai/whisper):  
`pip install -U openai-whisper`

*NOTE: The first time you run the model, it will download the model specified in `whisper.load_model("turbo")`. You may change the model before the first run if you prefer to download a different model.*
*Model Options: tiny, base, small, medium, large, turbo. See Whisper's ["Available Models and Languages"](https://github.com/openai/whisper#available-models-and-languages) section for more information.*

## Running from Anywhere
Add the following lines to your `.bashrc` file:
```
~/.bashrc
# Speech-to-Text Tools
export PATH="$PATH:/path/to/directory/where/these/scripts/live"

alias att="transcribe_audio"
alias batt="batch_transcribe_audio"
alias vtt="transcribe_video"
alias bvtt="batch_transcribe_video"
```

*NOTE: Be sure to edit the paths of the Bash Scripts to reflect the locations of the virtual environment and `speech_to_text.py` on your device.*  
*NOTE: Make sure all Bash scripts have executable permissions.*  

## Speech-to-Text for a Single File
#### Audio Files
Using the Python script directly on an audio file (only print the time-stamped transcript):  
`python speech_to_text.py <AUDIO_FILE>`  
Using the Bash script on an audio file:  
`transcribe_audio <AUDIO_FILE>`  
Using the aliased Bash script on an audio file:  
`att <AUDIO_FILE>`  

#### Video Files
Using the Bash script on an video file:  
`transcribe_video <VIDEO_FILE>`  
Using the aliased Bash script on an audio file:  
`vtt <VIDEO_FILE>`  

## Speech-to-Text for Many Files
*NOTE: Transcripts for each individual file will be produced and named in accordance with their input file. A combined transcript will be produced in file name order.*

#### Audio Files
Using the Bash script on a group of audio files:  
`batch_transcribe_audio <AUDIO_FILE_EXTENSION>`  e.g. `batch_transcribe_audio mp4`
Using the aliased Bash script on a group of audio files:  
`batt <AUDIO_FILE_EXTENSION>`  e.g. `batt mp4`

#### Video Files
Using the Bash script on a group of video files:  
`batch_transcribe_video <VIDEO_FILE_EXTENSION>`  e.g. `batch_transcribe_video mp4`
Using the aliased Bash script on a group of video files:  
`bvtt <VIDEO_FILE_EXTENSION>`  e.g. `bvtt mp4`
