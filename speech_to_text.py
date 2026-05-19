import whisper
import sys
import time

start_time = time.time()

model = whisper.load_model("turbo")
result = model.transcribe(sys.argv[1], verbose = True, fp16 = False)
transcript = result["text"]

end_time = time.time()

print(f"\nTranscription Completed in: {round(end_time - start_time, 1)} seconds\n")
